# <picture><source media="(prefers-color-scheme: dark)" srcset="../.github/icons/upsert-pr.svg"><img width=30 src="../.github/icons/upsert-pr-light.svg"></picture> `upsert-pr`

Commits current changes, force-pushes to a branch, and creates or updates a pull request from that branch using the GitHub Actions user.

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `branch` | Branch to commit and force-push to | `true` | |
| `base` | Base branch for the pull request | `false` | `main` |
| `message` | Commit message for the changes | `true` | |
| `title` | Title for the pull request | `true` | |
| `body` | Body for the pull request | `false` | `""` |
| `github-token` | GitHub token for PR operations | `false` | `github.token` |
| `force-push` | Set to `true` for using the `-f` option when pushing the branch | `false` | `"true"` |
| `force-add` | Set to `true` for using the `-f` option when adding changes | `false` | `"false"` |

## Outputs

| Output | Description |
| :--: | :--: |
| `pr-number` | The pull request number |
| `pr-url` | The pull request URL |
| `pushed` | Whether changes were pushed to the remote repository |

## Usage

```yaml
name: Auto-update configuration

on:
  push:
    branches: [main]

jobs:
  update-config:
    name: Update configuration
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write
    steps:
      - name: Checkout project
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Generate configuration
        run: echo "Generate or update files here..."

      - name: Create or update PR with changes
        uses: alejandrohdezma/actions/upsert-pr@v1
        with:
          message: "Update configuration [skip ci]"
          branch: auto-update/config
          title: "chore: Update configuration"
          body: "This PR contains auto-generated configuration updates."
```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>
