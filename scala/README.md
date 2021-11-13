# ![](../.github/icons/scala.png) `scala`

Scala CI pipeline based on Coursier and SBT.

It will do the following:

- Enable Coursier cache
- Setup Coursier (allowing to customize the JVM to install)
- Run a specific SBT task.

> It will also provide the provided GitHub token to SBT as a `GITHUB_TOKEN` environment variable.

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `github-token` | A valid GitHub token | `false` | `github.token` |
| `jvm` | The JVM to install | `false` | `adopt:1.11` |
| `task` | The SBT task to execute | `false` | `test` |

## Usage

```yaml
name: CI

on:
  pull_request:

jobs:
  ci:
    name: Scala CI
    runs-on: ubuntu-latest
    steps:
      - name: Checkout project
        uses: actions/checkout@1e204e9a9253d643386038d443f96446fa156a97 # v2.3.5

      - name: Run `sbt test`
        uses: alejandrohdezma/actions/scala@v1
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)