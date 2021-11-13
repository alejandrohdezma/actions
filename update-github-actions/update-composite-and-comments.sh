title=$(gh pr view $PR --json title --jq '.title')
regex="^Bump (.*)/(.*) from (.*) to (.*)"

getSha() {
    gh pr diff $1 |
        grep -m 1 -e "$2 *uses: $owner/$action" -e "$2 *- uses: $owner/$action" |
        sed -e "s/^$2 *- uses: $owner\/$action@//" |
        sed -e "s/^$2 *uses: $owner\/$action@//" |
        sed -e "s/ # .*//"
}

if [[ $title =~ $regex ]]; then
    owner=${BASH_REMATCH[1]}
    action=${BASH_REMATCH[2]}
    oldVersion=${BASH_REMATCH[3]}
    newVersion=${BASH_REMATCH[4]}

    oldSha=$(getSha $PR "-")
    newSha=$(getSha $PR "+")

    echo "Replacing SHA $oldSha with SHA $newSha for usages of $owner/$action GitHub action"
    echo "This change corresponds with the update from $oldVersion to $newVersion"

    for f in $(find . -name '*.yml'); do
        # Ensure composite actions get updated
        sed -i '' -e "s/uses: $owner\/$action@$oldSha/uses: $owner\/$action@$newSha/g" $f

        # Ensure comments get updated
        sed -i '' -e "s/uses: $owner\/$action@$newSha # $oldVersion/uses: $owner\/$action@$newSha # $newVersion/g" $f
        sed -i '' -e "s/uses: $owner\/$action@$newSha # v$oldVersion/uses: $owner\/$action@$newSha # v$newVersion/g" $f
    done

    echo "::set-output name=action::$owner/$action"
    echo "::set-output name=old-version::$oldVersion"
    echo "::set-output name=new-version::$newVersion"
fi
