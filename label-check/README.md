# <img height=30 src="../.github/icons/label-check.svg"> `label-check`

This action can be used to check that at least one of the mandatory labels is set in the PR.

## Mandatory labels (at least one must be present in the PR):

- :rocket: **feature**
- :blue_book: **documentation**
- :warning: **breaking**
- :beetle: **bug**
- :lipstick: **style**
- :package: **refactor**
- :broom: **cleaning**
- :wrench: **build**
- :test_tube: **test**
- :chart_with_upwards_trend: **dependency-update**

## Usage

```yaml
name: Check label in PR

on:
  pull_request:
    types: [opened, reopened, labeled, unlabeled, synchronize]

jobs:
  labeler:
    name: Label check
    runs-on: ubuntu-latest
    steps:
      - name: Check PR labels
        uses: alejandrohdezma/actions/label-check@v1
```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>