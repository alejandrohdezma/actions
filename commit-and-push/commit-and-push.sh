if [ -n "$(git status -s)" ]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    echo "👤 Git identity set to $GIT_NAME <$GIT_EMAIL>"

    git checkout -B $GIT_BRANCH || { echo "::error::Unable to switch to branch $GIT_BRANCH" && exit 1; }

    if [[ $GIT_FORCE_ADD == 'true' ]]; then
        git add -f .
    else
        git add .
    fi

    if [[ $GIT_AMEND == 'true' ]]; then
        git commit --amend --no-edit
    else
        git commit --message=''"$GIT_MESSAGE"'' --author="$GIT_NAME <$GIT_EMAIL>"
    fi
else
    echo "🧺 Working tree clean. Nothing to commit."
fi

REMOTE_SHA=$(git ls-remote origin "refs/heads/$GIT_BRANCH" | cut -f1)

if [ "$REMOTE_SHA" = "$(git rev-parse HEAD)" ]; then
    echo "🧺 Branch $GIT_BRANCH is already up to date. Nothing to push."
    echo "pushed=false" >> "$GITHUB_OUTPUT"
elif [[ $GIT_FORCE_PUSH == 'true' || $GIT_AMEND == 'true' ]]; then
    git push -f --set-upstream origin "HEAD:$GIT_BRANCH" --atomic || { echo "::error::Unable to push to branch" && exit 1; }

    echo "🚀 Changes have been pushed to branch $GIT_BRANCH"
    echo "pushed=true" >> "$GITHUB_OUTPUT"
else
    git push --set-upstream origin "HEAD:$GIT_BRANCH" --atomic || { echo "::error::Unable to push to branch $GIT_BRANCH (it has diverged and force-push is disabled)" && exit 1; }

    echo "🚀 Changes have been pushed to branch $GIT_BRANCH"
    echo "pushed=true" >> "$GITHUB_OUTPUT"
fi
