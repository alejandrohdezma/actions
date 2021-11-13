# ![](../.github/icons/init-labels.png) `init-labels`

This action can be used to initialize a repository with some predefined labels listed under
[labels.json](https://github.com/alejandrohdezma/actions/blob/v1/init-labels/labels.json).

## Inputs

| Input | Description | Required |
| :--: | :--: | :--: |
| `github-token` | A valid GitHub token | `true` |
| `target-repo` | Repository in which to initialize the labels | `true` |

## Usage

```yaml
name: Initialize labels

on:
  workflow_dispatch:

jobs:
  sync:
    name: ${{ matrix.repo }} - Initialize labels
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        repo:
            - owner/first-repo
            - owner/second-repo
    steps:
      - name: Initialize labels in ${{ matrix.repo }}
        uses: alejandrohdezma/actions/init-labels@v1
        with:
          github-token: ${{ secrets.MY_TOKEN }}
          target-repo: ${{ matrix.repo }}
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)