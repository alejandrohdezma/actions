# ![](../.github/icons/commit-and-push.png) `commit-and-push`

Creates a new commit with current changes and push them to the selected branch using the GitHub Actions user.

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `branch` | Branch where changes should be pushed too | `false` | `github.head_ref` |
| `message` | Message for the new commit | `true` | |

## Usage

```yaml
name: Bump documentation

on:
  push:

jobs:
  documentation:
    name: Bump documentation
    runs-on: ubuntu-latest
    steps:
      - name: Checkout project
        uses: actions/checkout@1e204e9a9253d643386038d443f96446fa156a97 # v2.3.5
        with:
          fetch-depth: 0
          ref: main
          token: ${{ secrets.MY_GITHUB_TOKEN }}

      - name: Bump documentation
        run: echo "Do something here..."

      - name: Commit changes with new documentation
        uses: alejandrohdezma/actions commit-and-push@v1
        with:
          message: Bump documentation [skip ci]
          branch: main
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)