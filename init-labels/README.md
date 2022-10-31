# ![](../.github/icons/init-labels.png) `init-labels`

This action can be used to initialize a repository with some predefined labels listed under
[labels.json](https://github.com/alejandrohdezma/actions/blob/v1/init-labels/labels.json).

## Inputs

| Input | Description | Required |
| :--: | :--: | :--: |
| `github-token` | A valid GitHub token | `true` |
| `target-repo` | Repository in which to initialize the labels | `true` |

## Usage

You can use the `sizes` input to control how size labels are created. Just
add a 5 element comma-separated list with the values from XXL to XS. Defaults to:

```bash
XXL=2000
XL=1000
L=500
M=100
S=50
XS=10
```

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
          sizes: 2000,1000,500,100,50,10
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)