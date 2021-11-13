mandatory='[
    ":beetle: bug", ":blue_book: documentation", ":chart_with_upwards_trend: dependency-update",
    ":lipstick: style", ":package: refactor", ":rocket: feature", ":test_tube: tests",
    ":warning: breaking", ":wrench: build", ":broom: cleaning"
]'

allowed_labels=$(echo $mandatory | jq -r 'map(" - " + .) | join("%0A")')

echo "🔎 Searching PR labels..."

pr_labels=$(gh pr view $PR --json labels)
pr_label_names=$(echo $pr_labels | jq -r '.labels | map(.name) | join(", ")')
pr_label_count=$(echo $pr_labels | jq '.labels | length')

if (($pr_label_count == 0)); then
    echo "::error title=❌ The PR doesn't have any label::It must have at least one of these:%0A%0A$allowed_labels"
    exit 1
fi

echo "🏷 PR has $pr_label_count labels: $pr_label_names"

count=$(echo $pr_labels | jq -c --argjson allowed "$mandatory" '.labels | map(.name) | map(select(. as $name | $allowed | index($name))) | length')

if (($count > 0)); then
    echo "✅ PR has at least one of the mandatory labels"
else
    echo "::error title=❌ Missing mandatory label in PR::It must have at least one of these:%0A%0A$allowed_labels"
    exit 1
fi
