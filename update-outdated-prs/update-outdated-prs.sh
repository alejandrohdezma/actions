prs_merging_to_branch=$(gh api "/repos/$GITHUB_REPOSITORY/pulls?base=$BRANCH")
non_draft_prs=$(echo $prs_merging_to_branch | jq 'map(select(.draft == false)) | map(.head.ref)')
count=$(echo $non_draft_prs | jq length)

if (($count == 0)); then
    echo "🔍 No PRs found merging against $BRANCH branch on $GITHUB_REPOSITORY"
else
    echo "🔍 Found $count PRs merging against $BRANCH branch on $GITHUB_REPOSITORY"

    for branch in $(echo $non_draft_prs | jq -r '.[]'); do
        echo "🔗 Merging branch $BRANCH onto $branch..."

        body="{\"base\": \"$branch\", \"head\": \"$BRANCH\"}"
        url="$GITHUB_API_URL/repos/$GITHUB_REPOSITORY/merges"

        status_code=$(curl -s -o response.txt -w "%{http_code}" -H "Authorization: token $GITHUB_TOKEN" -X POST $url -d "$body")

        case $status_code in
        "201")
            echo "✅ PR updated succesfully"
            ;;
        "204")
            echo "✅ PR already up-to-date"
            ;;
        "403")
            echo "::error title=🔒 Invalid credentials. Did you select the correct token?::$(cat response.txt)"
            ;;
        "409")
            echo "::notice ::🚧 Found some conflicts when trying to update branch $branch"
            ;;
        *)
            echo "::error title=❌ Some error found when trying to update branch $branch::$(cat response.txt)"
            ;;
        esac

        rm response.txt
    done
fi
