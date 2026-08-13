#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
REGISTRY="${PUBLIC_PROGRAM_REGISTRY:-$REPO_ROOT/registry/public-program-evidence-cards-v1.json}"

need() { command -v "$1" >/dev/null 2>&1 || { echo "ERROR: required command missing: $1" >&2; exit 2; }; }
need gh
need jq

[[ -f "$REGISTRY" ]] || { echo "ERROR: public-program registry not found: $REGISTRY" >&2; exit 2; }
jq -e '.schema == "8x8.public-program-evidence-cards.v1" and .canonical_root == "fabric://8x8/core"' "$REGISTRY" >/dev/null || {
  echo "ERROR: unexpected public-program registry schema/root" >&2
  exit 2
}

ORG="$(jq -r '.organization' "$REGISTRY")"
PROJECT_NUMBER="$(jq -r '.project_number' "$REGISTRY")"
EXPECTED_TITLE="$(jq -r '.project_title' "$REGISTRY")"
ISSUE_REPO="$(jq -r '.issue_repository' "$REGISTRY")"
mapfile -t ISSUES < <(jq -r '.cards[] | select(.desired_project_presence == true) | .issue' "$REGISTRY")

[[ ${#ISSUES[@]} -gt 0 ]] || { echo "ERROR: registry contains no desired project cards" >&2; exit 2; }
[[ "$(printf '%s\n' "${ISSUES[@]}" | sort -n | uniq -d | wc -l | tr -d ' ')" == "0" ]] || {
  echo "ERROR: duplicate issue numbers in registry" >&2
  exit 2
}

gh auth status >/dev/null 2>&1 || {
  echo "ERROR: gh is not authenticated. Authenticate an owner/admin account with GitHub Projects access, then rerun." >&2
  exit 3
}

PROJECT_JSON="$(gh api graphql \
  -f query='query($org:String!,$number:Int!){organization(login:$org){projectV2(number:$number){id title public url}}}' \
  -F org="$ORG" -F number="$PROJECT_NUMBER")"

PROJECT_ID="$(jq -r '.data.organization.projectV2.id // empty' <<<"$PROJECT_JSON")"
PROJECT_TITLE="$(jq -r '.data.organization.projectV2.title // empty' <<<"$PROJECT_JSON")"
PROJECT_URL="$(jq -r '.data.organization.projectV2.url // empty' <<<"$PROJECT_JSON")"

[[ -n "$PROJECT_ID" ]] || {
  echo "ERROR: Project #$PROJECT_NUMBER could not be resolved. Ensure the authenticated account has project access." >&2
  exit 4
}
[[ "$PROJECT_TITLE" == "$EXPECTED_TITLE" ]] || {
  echo "ERROR: fail-closed title mismatch: expected '$EXPECTED_TITLE', got '$PROJECT_TITLE'." >&2
  exit 5
}

# Explicit owner-authorized visibility mutation: make the existing project public.
gh api graphql \
  -f query='mutation($projectId:ID!){updateProjectV2(input:{projectId:$projectId,public:true}){projectV2{id title public url}}}' \
  -F projectId="$PROJECT_ID" >"${TMPDIR:-/tmp}/8x8-project-public.json"

# Resolve current project items before adding anything. Retries are idempotent:
# already-attached issues are preserved and skipped.
CURRENT_ITEMS_JSON="$(gh api graphql \
  -f query='query($org:String!,$number:Int!){organization(login:$org){projectV2(number:$number){items(first:100){nodes{id content{... on Issue{number title url repository{nameWithOwner}}}}}}}}' \
  -F org="$ORG" -F number="$PROJECT_NUMBER")"

ADDED_JSON='[]'
for n in "${ISSUES[@]}"; do
  EXISTING_ITEM_ID="$(jq -r --argjson n "$n" --arg repo "$ISSUE_REPO" '
    [.data.organization.projectV2.items.nodes[]
      | select(.content.repository.nameWithOwner == $repo and .content.number == $n)
      | .id][0] // empty
  ' <<<"$CURRENT_ITEMS_JSON")"

  if [[ -n "$EXISTING_ITEM_ID" ]]; then
    TITLE="$(jq -r --argjson n "$n" --arg repo "$ISSUE_REPO" '
      [.data.organization.projectV2.items.nodes[]
        | select(.content.repository.nameWithOwner == $repo and .content.number == $n)
        | .content.title][0] // empty
    ' <<<"$CURRENT_ITEMS_JSON")"
    URL="$(jq -r --argjson n "$n" --arg repo "$ISSUE_REPO" '
      [.data.organization.projectV2.items.nodes[]
        | select(.content.repository.nameWithOwner == $repo and .content.number == $n)
        | .content.url][0] // empty
    ' <<<"$CURRENT_ITEMS_JSON")"
    ADDED_JSON="$(jq -c --argjson n "$n" --arg title "$TITLE" --arg url "$URL" --arg item_id "$EXISTING_ITEM_ID" '. + [{issue:$n,title:$title,url:$url,item_id:$item_id,action:"PRESERVED_EXISTING"}]' <<<"$ADDED_JSON")"
    continue
  fi

  ISSUE_JSON="$(gh api "repos/${ISSUE_REPO}/issues/${n}")"
  CONTENT_ID="$(jq -r '.node_id // empty' <<<"$ISSUE_JSON")"
  TITLE="$(jq -r '.title // empty' <<<"$ISSUE_JSON")"
  URL="$(jq -r '.html_url // empty' <<<"$ISSUE_JSON")"
  [[ -n "$CONTENT_ID" ]] || { echo "ERROR: could not resolve node id for issue #$n" >&2; exit 6; }

  ITEM_JSON="$(gh api graphql \
    -f query='mutation($projectId:ID!,$contentId:ID!){addProjectV2ItemById(input:{projectId:$projectId,contentId:$contentId}){item{id}}}' \
    -F projectId="$PROJECT_ID" -F contentId="$CONTENT_ID")"
  ITEM_ID="$(jq -r '.data.addProjectV2ItemById.item.id // empty' <<<"$ITEM_JSON")"
  [[ -n "$ITEM_ID" ]] || { echo "ERROR: project item add failed for issue #$n" >&2; exit 7; }
  ADDED_JSON="$(jq -c --argjson n "$n" --arg title "$TITLE" --arg url "$URL" --arg item_id "$ITEM_ID" '. + [{issue:$n,title:$title,url:$url,item_id:$item_id,action:"ADDED"}]' <<<"$ADDED_JSON")"
done

# GitHub Projects v2 can be eventually consistent immediately after item mutations.
# Verify with bounded retry/backoff and retain the final raw snapshot for diagnostics.
VERIFY_JSON=''
VERIFY_OK=false
MISSING_JSON='[]'
DELAYS=(0 1 2 3 5 8 13 21)
for idx in "${!DELAYS[@]}"; do
  delay="${DELAYS[$idx]}"
  if (( delay > 0 )); then
    sleep "$delay"
  fi

  VERIFY_JSON="$(gh api graphql \
    -f query='query($org:String!,$number:Int!){organization(login:$org){projectV2(number:$number){id title public url items(first:100){nodes{content{... on Issue{number title url repository{nameWithOwner}}}}}}}}' \
    -F org="$ORG" -F number="$PROJECT_NUMBER")"
  printf '%s\n' "$VERIFY_JSON" >"${TMPDIR:-/tmp}/8x8-project-verify-last.json"

  PUBLIC="$(jq -r '.data.organization.projectV2.public // false' <<<"$VERIFY_JSON")"
  MISSING_JSON='[]'
  for n in "${ISSUES[@]}"; do
    if ! jq -e --argjson n "$n" --arg repo "$ISSUE_REPO" '
      [.data.organization.projectV2.items.nodes[].content
        | select(.repository.nameWithOwner == $repo and .number == $n)] | length > 0
    ' <<<"$VERIFY_JSON" >/dev/null; then
      MISSING_JSON="$(jq -c --argjson n "$n" '. + [$n]' <<<"$MISSING_JSON")"
    fi
  done

  if [[ "$PUBLIC" == "true" && "$MISSING_JSON" == "[]" ]]; then
    VERIFY_OK=true
    break
  fi

  echo "VERIFY attempt $((idx+1))/${#DELAYS[@]}: public=$PUBLIC missing=$MISSING_JSON" >&2
done

if [[ "$VERIFY_OK" != "true" ]]; then
  echo "ERROR: Project verification did not converge after bounded retries; public=$(jq -r '.data.organization.projectV2.public // false' <<<"$VERIFY_JSON") missing=$MISSING_JSON" >&2
  echo "DIAGNOSTIC: ${TMPDIR:-/tmp}/8x8-project-verify-last.json" >&2
  exit 9
fi

TS="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
RECEIPT="${TMPDIR:-/tmp}/8x8-public-program-project-v2-receipt.json"
jq -n \
  --arg timestamp "$TS" \
  --arg org "$ORG" \
  --arg project_id "$PROJECT_ID" \
  --arg project_title "$PROJECT_TITLE" \
  --arg project_url "$PROJECT_URL" \
  --arg registry "$REGISTRY" \
  --argjson public true \
  --argjson items "$ADDED_JSON" \
  '{schema_version:"1.4",timestamp:$timestamp,organization:$org,project_id:$project_id,project_title:$project_title,project_url:$project_url,registry:$registry,public:$public,items:$items,status:"PASS"}' \
  | tee "$RECEIPT"

echo "PASS: Project #$PROJECT_NUMBER is public and all registry-configured evidence cards are attached."
echo "RECEIPT=$RECEIPT"
