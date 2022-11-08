# <img height=30 src="../.github/icons/check-semver-tag.svg"> `check-semver-tag`

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

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>