# ![](../.github/icons/check-semver-tag.png) `check-semver-tag`

Checks that a tag contains a valid semver version prefixed with `v` (e.g. `1.1.5`).

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `tag` | The tag under testing | `false` | `github.ref` |

## Usage

```yaml
name: Release

on:
  push:
    tags: [v*]

jobs:
  release:
    name: Release a new version
    runs-on: ubuntu-latest
    steps:
      - name: Checkout project
        uses: actions/checkout@1e204e9a9253d643386038d443f96446fa156a97 # v2.3.5
        with:
          fetch-depth: 0

      - name: Check latest tag follows semantic versioning
        uses: alejandrohdezma/actions/check-semver-tag@v1

      - name: Release
        run: echo "Do something here..."
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)