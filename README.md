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
| <img src=".github/icons/check-semver-tag.svg" width=50> | **[`check-semver-tag` _(checks tag contains valid semver version)_](./check-semver-tag/README.md)** |
| <img src=".github/icons/commit-and-push.svg" width=50> | **[`commit-and-push` _(creates and pushes new commit with current changes)_](./commit-and-push/README.md)** |
| <img src=".github/icons/github-app-token.svg" width=50> | **[`github-app-token` _(retrieve GitHub App installation token)_](./github-app-token/README.md)** |
| <img src=".github/icons/label-check.svg" width=50> | **[`label-check` _(check PR labels for a set of mandatory ones)_](./label-check/README.md)** |
| <img src=".github/icons/labeler.svg" width=50> | **[`labeler` _(auto-label PRs based on branch/size)_](./labeler/README.md)** |
| <img src=".github/icons/update-github-actions.svg" width=50> | **[`update-github-actions` _(updates versions in composite actions and comments)_](./update-github-actions/README.md)** |
| <img src=".github/icons/update-outdated-prs.svg" width=50> | **[`update-outdated-prs` _(updates out-of-date PRs merging to certain branch)_](./update-outdated-prs/README.md)** |
