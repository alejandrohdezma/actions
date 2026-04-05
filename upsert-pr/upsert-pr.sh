PR_NUMBER=$(gh pr list --head "$GIT_BRANCH" --base "$PR_BASE" --state open --json number --jq '.[0].number // empty')

if [ -n "$PR_NUMBER" ]; then
    gh pr edit "$PR_NUMBER" --title "$PR_TITLE" --body "$PR_BODY"
    PR_URL=$(gh pr view "$PR_NUMBER" --json url --jq '.url')
    echo "📝 Updated PR #$PR_NUMBER"
else
    PR_URL=$(gh pr create --head "$GIT_BRANCH" --base "$PR_BASE" --title "$PR_TITLE" --body "$PR_BODY")
    PR_NUMBER=$(gh pr view "$PR_URL" --json number --jq '.number')
    echo "🆕 Created PR #$PR_NUMBER"
fi

echo "pr-number=$PR_NUMBER" >> "$GITHUB_OUTPUT"
echo "pr-url=$PR_URL" >> "$GITHUB_OUTPUT"
