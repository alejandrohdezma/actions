if [ -n "$(git status -s)" ]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    echo "👤 Git identity set to $GIT_NAME <$GIT_EMAIL>"

    git fetch --depth=1
    git checkout -b $GIT_BRANCH
    git add .
    git commit --message=''"$GIT_MESSAGE"'' --author="$GIT_NAME <$GIT_EMAIL>"
    git push --set-upstream origin "HEAD:$GIT_BRANCH" --atomic
    echo "🚀 Changes have been pushed to branch $GIT_BRANCH"
else
    echo "🧺 Working tree clean. Nothing to commit."
fi
