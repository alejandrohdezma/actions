gh alias set add-size-label --shell 'gh pr edit $1 --add-label "$2" &&
  gh pr view $1 --json labels -q '"'"'.labels | map(.name) | map(select(startswith(":balance_scale:")))'"'"' |
  jq --arg LABEL "$2" -r '"'"'map(select(. != $LABEL)) | .[]'"'"' |
  parallel gh pr edit $1 --remove-label "{}"'

if (($CHANGES > 2000)); then
  gh add-size-label $PR ":balance_scale: XXL"
elif (($CHANGES > 1000)); then
  gh add-size-label $PR ":balance_scale: XL"
elif (($CHANGES > 500)); then
  gh add-size-label $PR ":balance_scale: L"
elif (($CHANGES > 100)); then
  gh add-size-label $PR ":balance_scale: M"
elif (($CHANGES > 50)); then
  gh add-size-label $PR ":balance_scale: S"
elif (($CHANGES > 10)); then
  gh add-size-label $PR ":balance_scale: XS"
else
  gh add-size-label $PR ":balance_scale: XXS"
fi
