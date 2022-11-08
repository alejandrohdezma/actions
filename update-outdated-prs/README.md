# <img height=30 src="../.github/icons/update-outdated-prs.svg"> `update-outdated-prs`

This action will update the PRs merging to the current branch that are out-of-date.

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `github-token` | A valid GitHub token | `true` | |
| `branch` | PRs merging to this branch will be updated | `false` | Repository's default branch |

## Usage

```yaml
name: Auto-update PRs merging to `main`

on:
  push:
    branches: [main]

jobs:
  auto-update-outdated-prs-to-latest-main:
    name: Update outdated PRs to latest `main`
    runs-on: ubuntu-latest
    steps:
      - name: Update outdated PRs to latest `main`
        uses: alejandrohdezma/actions/update-outdated-prs@v1
        with:
          branch: main
          github-token: ${{ secrets.MY_TOKEN }}
```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>