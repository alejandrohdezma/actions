if [[ $TAG =~ ^(refs/tags/)?v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "🏷 $TAG follows semver"
else
    echo "::error ::Tag $TAG does not follow the pattern 'vX.X.X'"
fi
