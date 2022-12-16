# Utility GitHub Actions

This repository contain some highly-opinionated generic actions that can be used accross many
repositories. Most of the actions in this repo are implemented using the 
[`gh` CLI](https://cli.github.com). For the ones using external actions the version has been set to a
trustable SHA, instead of using a tag or branch that can be changed.

Whenever using actions from this repository I recommend using the latest trustable SHA published in
the `v1` branch instead of `alejandrohdezma/actions/some-action@v1`.

## Available actions

| | |
| :--: | :-- |
| <picture><source media="(prefers-color-scheme: dark)" srcset=".github/icons/check-semver-tag.svg"><img width=50 src=".github/icons/check-semver-tag-light.svg"></picture> | **[`check-semver-tag` _(checks tag contains valid semver version)_](./check-semver-tag/README.md)** |
| <picture><source media="(prefers-color-scheme: dark)" srcset=".github/icons/commit-and-push.svg"><img width=50 src=".github/icons/commit-and-push-light.svg"></picture> | **[`commit-and-push` _(creates and pushes new commit with current changes)_](./commit-and-push/README.md)** |
| <picture><source media="(prefers-color-scheme: dark)" srcset=".github/icons/github-app-token.svg"><img width=50 src=".github/icons/github-app-token-light.svg"></picture> | **[`github-app-token` _(retrieve GitHub App installation token)_](./github-app-token/README.md)** |
| <picture><source media="(prefers-color-scheme: dark)" srcset=".github/icons/label-check.svg"><img width=50 src=".github/icons/label-check-light.svg"></picture> | **[`label-check` _(check PR labels for a set of mandatory ones)_](./label-check/README.md)** |
| <picture><source media="(prefers-color-scheme: dark)" srcset=".github/icons/labeler.svg"><img width=50 src=".github/icons/labeler-light.svg"></picture> | **[`labeler` _(auto-label PRs based on branch/size)_](./labeler/README.md)** |
