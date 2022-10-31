gh alias set add-size-label --shell 'gh pr edit $1 --add-label "$2" &&
  gh pr view $1 --json labels -q '"'"'.labels | map(.name) | map(select(startswith(":balance_scale:")))'"'"' |
  jq --arg LABEL "$2" -r '"'"'map(select(. != $LABEL)) | .[]'"'"' |
  parallel gh pr edit $1 --remove-label "{}"'

SIZES_ARRAY=(${SIZES//,/ })
XXL=${SIZES_ARRAY[0]}
XL=${SIZES_ARRAY[1]}
L=${SIZES_ARRAY[2]}
M=${SIZES_ARRAY[3]}
S=${SIZES_ARRAY[4]}
XS=${SIZES_ARRAY[5]}

if (($CHANGES > $XXL)); then
  gh add-size-label $PR ":balance_scale: XXL"
elif (($CHANGES > $XL)); then
  gh add-size-label $PR ":balance_scale: XL"
elif (($CHANGES > $L)); then
  gh add-size-label $PR ":balance_scale: L"
elif (($CHANGES > $M)); then
  gh add-size-label $PR ":balance_scale: M"
elif (($CHANGES > $S)); then
  gh add-size-label $PR ":balance_scale: S"
elif (($CHANGES > $XS)); then
  gh add-size-label $PR ":balance_scale: XS"
else
  gh add-size-label $PR ":balance_scale: XXS"
fi
