# <picture><source media="(prefers-color-scheme: dark)" srcset="../.github/icons/update-github-actions.svg"><img width=30 src="../.github/icons/update-github-actions-light.svg"></picture> `update-github-actions`

Improves the default update system for GitHub Actions by Dependabot by allowing to update composite
actions `action.yml` and comments of the form `# vX.X.X` when SHA versions are used.

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `pr` | The PR to update | `false` | `github.event.pull_request.html_url` |
| `github-token` | A valid GitHub token | `false` | `github.token` |

## Usage

```yaml
name: Ensure composite actions and comments get updated

on:
  pull_request_target:

permissions:
  pull-requests: write

jobs:
  update-github-actions:
    name: Launch `update-github-actions` action on this PR
    if: ${{ github.actor == 'dependabot[bot]' }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout project
        uses: actions/checkout@ec3a7ce113134d7a93b817d10a8272cb61118579 # v2.4.0

      - name: Launch `update-github-actions` action
        id: update-github-actions
        uses: alejandrohdezma/actions/update-github-actions@v1

      - name: Commit new changes
        uses: alejandrohdezma/actions/commit-and-push@v1
        with:
          message: >
            Update ${{ steps.update-github-actions.outputs.action }}
            from ${{ steps.update-github-actions.outputs.old-version }}
            to ${{ steps.update-github-actions.outputs.new-version }}
            in comments and composite actions

```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>