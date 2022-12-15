if [ -n "$(git status -s)" ]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    echo "👤 Git identity set to $GIT_NAME <$GIT_EMAIL>"

    git fetch --depth=1
    git checkout -B $GIT_BRANCH || (echo "::error::Unable to switch to branch $GIT_BRANCH" && exit 1)
    
    if [[ $GIT_FORCE_ADD == 'true' ]]; then
        git add -f .
    else
        git add .
    fi
    
    git commit --message=''"$GIT_MESSAGE"'' --author="$GIT_NAME <$GIT_EMAIL>"
    
    if [[ $GIT_FORCE_PUSH == 'true' ]]; then
        git push -f --set-upstream origin "HEAD:$GIT_BRANCH" --atomic || (echo "::error::Unable to push to branch" && exit 1)
    else
        git push --set-upstream origin "HEAD:$GIT_BRANCH" --atomic || (echo "::error::Unable to push to branch" && exit 1)
    fi

    echo "🚀 Changes have been pushed to branch $GIT_BRANCH"
else
    echo "🧺 Working tree clean. Nothing to commit."
fi
