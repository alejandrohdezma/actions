# 🏷 `labeler`

This action can be used to automatically label PRs based on their branch/size.

## Labels:

| Label | Matching branch | PR size |
| :---: | :---: | :---: |
| :rocket: **feature** | `^feat.*` | - |
| :blue_book: **documentation** | `^doc.*/.*` | - |
| :warning: **breaking** | `^break.*/.*` | - |
| :beetle: **bug** | `^bug/.*` or `^fix/.*` | - |
| :lipstick: **style** | `^style/.*` or `^format/.*` | - |
| :package: **refactor** | `^refactor/.*` | - |
| :broom: **cleaning** | `^remove/.*` or `^clean.*/.*` | - |
| :wrench: **build** | `^build/.*` | - |
| :test_tube: **test** | `^test.*` | - |
| :chart_with_upwards_trend: **dependency-update** | `^updates` or `^update.*/.*` or `^dep.*/.*` | - |
| :balance_scale: **XXL** | - | > 2000 |
| :balance_scale: **XL** | - | > 1000 |
| :balance_scale: **L** | - | > 500 |
| :balance_scale: **M** | - | > 100 |
| :balance_scale: **S** | - | > 50 |
| :balance_scale: **XS** | - | > 10 |
| :balance_scale: **XXS** | - | <= 10 |

## Usage

```yaml
name: Label PR

on:
  pull_request:

jobs:
  labeler:
    name: Labeler
    runs-on: ubuntu-latest
    steps:
      - name: Update PR labels
        uses: alejandrohdezma/actions/labeler@v1
```

[![](https://img.shields.io/badge/Go%20back-gray?style=for-the-badge)](https://github.com/alejandrohdezma/actions)