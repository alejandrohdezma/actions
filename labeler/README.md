# 🏷 `labeler`

This action can be used to automatically label PRs based on their branch/size.
It will also initialize the repository with missing labels from [labels.json][1].

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
| :balance_scale: **XXL** | - | > ${{ inputs.sizes[0] }} |
| :balance_scale: **XL** | - | > ${{ inputs.sizes[1] }} |
| :balance_scale: **L** | - | > ${{ inputs.sizes[2] }} |
| :balance_scale: **M** | - | > ${{ inputs.sizes[3] }} |
| :balance_scale: **S** | - | > ${{ inputs.sizes[4] }} |
| :balance_scale: **XS** | - | > ${{ inputs.sizes[5] }} |
| :balance_scale: **XXS** | - | <= ${{ inputs.sizes[5] }} |

## Inputs

| Input | Description | Required | Default |
| :--: | :--: | :--: | :--: |
| `token` | The GitHub Token used to create/add labels | `false` | `github.token` |
| `delete-unrecognised-labels` | Wheter this action should delete labels not present on [`labels.json`][1] | `false` | `true` |
| `sizes` | Number of changes for each size as an integer comma-separated array | `false` | 2000,1000,500,100,50,10 |

## Usage

You can use the `sizes` input to control how size labels are applied. Just
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
        with:
          sizes: 2000,1000,500,100,50,10
```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>

[1]: https://github.com/alejandrohdezma/actions/blob/v1/labeler/labels.json