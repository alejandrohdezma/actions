# ![](../.github/icons/github-app-token.png) `github-app-token`

This action Retrieves the `installation_token` for a GitHub App. Given a credentials token containing
the GitHub App ID, the installation ID and the private key as JSON in base64. You can get such token
from [here](https://dtinth.github.io/obtain-github-app-installation-access-token).

## Inputs

| Input | Description | Required |
| :--: | :--: | :--: |
| `token` | The GitHub App credentials token | `true` |

## Usage

```yaml
name: Get GitHub App installation token

on:
  push:

jobs:
  get-github-app-installation-token:
    name: Get GitHub App installation token
    runs-on: ubuntu-latest
    steps:
      - name: Get GitHub App installation token
        uses: alejandrohdezma/actions/github-app-token@v1
        id: github_app
        with:
          token: ${{ secrets.MY_GH_APP_TOKEN }}

      - name: Checkout project
        uses: actions/checkout@ec3a7ce113134d7a93b817d10a8272cb61118579 # v2.4.0
        with:
          token: ${{ steps.github_app.outputs.token }}
```

<a href="../README.md#available-actions"><img height=15 src="../.github/icons/go-back.svg"> <b>Go back</b></a>