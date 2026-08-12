#!/usr/bin/env bash
set -Eeuo pipefail

ORG="8x8org"
PROJECT_NUMBER=1
EXPECTED_TITLE="8x8 OS Public Program"
ISSUE_REPO="8x8org/.github"
ISSUES=(9 10 11 12 13)

need() { command -v "$1" >/dev/null 2>&1 || { echo "ERROR: required command missing: $1" >&2; exit 2; }; }
need gh
need jq

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
  -F projectId="$PROJECT_ID" >/tmp/8x8-project-public.json

# Resolve current project items before adding anything. This makes retries safe after
# a partial prior run: already-attached competition issues are preserved and skipped.
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

VERIFY_JSON="$(gh api graphql \
  -f query='query($org:String!,$number:Int!){organization(login:$org){projectV2(number:$number){id title public url items(first:100){nodes{content{... on Issue{number title url repository{nameWithOwner}}}}}}}}' \
  -F org="$ORG" -F number="$PROJECT_NUMBER")"

PUBLIC="$(jq -r '.data.organization.projectV2.public' <<<"$VERIFY_JSON")"
[[ "$PUBLIC" == "true" ]] || { echo "ERROR: project did not verify public after mutation" >&2; exit 8; }

for n in "${ISSUES[@]}"; do
  jq -e --argjson n "$n" --arg repo "$ISSUE_REPO" '
    [.data.organization.projectV2.items.nodes[].content
      | select(.repository.nameWithOwner == $repo and .number == $n)] | length > 0
  ' <<<"$VERIFY_JSON" >/dev/null || {
    echo "ERROR: issue #$n is not visible in Project #$PROJECT_NUMBER after mutation" >&2
    exit 9
  }
done

TS="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
jq -n \
  --arg timestamp "$TS" \
  --arg org "$ORG" \
  --arg project_id "$PROJECT_ID" \
  --arg project_title "$PROJECT_TITLE" \
  --arg project_url "$PROJECT_URL" \
  --argjson public true \
  --argjson items "$ADDED_JSON" \
  '{schema_version:"1.1",timestamp:$timestamp,organization:$org,project_id:$project_id,project_title:$project_title,project_url:$project_url,public:$public,items:$items,status:"PASS"}' \
  | tee /tmp/8x8-public-program-project-v2-receipt.json

echo "PASS: Project #$PROJECT_NUMBER is public and issues 9-13 are attached."
