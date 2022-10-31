gh alias set add-label --shell 'echo $2 | gh api --silent -X POST "/repos/$1/labels" --input -'

# Get current labels in $TARGET_REPO
current=$(gh api "/repos/$TARGET_REPO/labels" --paginate)
current_names=$(echo $current | jq 'map(.name)')

# Get number for each size label
SIZES_ARRAY=(${SIZES//,/ })
XXL=${SIZES_ARRAY[0]}
XL=${SIZES_ARRAY[1]}
L=${SIZES_ARRAY[2]}
M=${SIZES_ARRAY[3]}
S=${SIZES_ARRAY[4]}
XS=${SIZES_ARRAY[5]}

# Get labels listed in the $LABELS_FILE JSON file
labels=$(
    cat $LABELS_FILE | jq -c '. |=sort_by(.name)' |
        sed "s/@XXL@/$XXL/g" | sed "s/@XL@/$XL/g" | sed "s/@L@/$L/g" |
        sed "s/@M@/$M/g" | sed "s/@S@/$S/g" | sed "s/@XS@/$XS/g"
)
label_names=$(echo $labels | jq 'map(.name)')

filter_not_in_labels='map(select(.name as $name | $labels | index($name) | not))'

# Delete labels present on the $TARGET_REPO not present on the labels.json file
echo $current |
    jq -r --argjson labels "$label_names" "$filter_not_in_labels  | .[].name" |
    parallel gh api -X DELETE "/repos/$TARGET_REPO/labels/{}"

# Add labels present on the labels.json file not present on the $TARGET_REPO
echo $labels |
    jq -c --argjson labels "$current_names" "$filter_not_in_labels | .[]" |
    parallel gh add-label $TARGET_REPO '{}'
