# Utility GitHub Actions

This repository contain some generic highly-opinionated actions that can be used accross many
repositories. Most of the actions in this repo are created using the 
[`gh` CLI](https://cli.github.com). For the ones using external actions the version has been set to a
trustable SHA, instead of using a tag or branch that can be changed.

Whenever using actions from this repository I recommend using the latest trustable SHA published in
the `v1` branch instead of `alejandrohdezma/actions/some-action@v1`.

## Available actions

### <img src=".github/icons/check-semver-tag.png" height=20> [`check-semver-tag` _(checks tag contains valid semver version)_](./check-semver-tag/README.md)

### <img src=".github/icons/commit-and-push.png" height=20>  [`commit-and-push` _(creates and pushes new commit with current changes)_](./commit-and-push/README.md)

### <img src=".github/icons/github-app-token.png" height=20>  [`github-app-token` _(retrieve GitHub App installation token)_](./github-app-token/README.md)

### <img src=".github/icons/init-labels.png" height=20> [`init-labels` _(initialize repository labels)_](./init-labels/README.md)

### <img src=".github/icons/label-check.png" height=20> [`label-check` _(check PR labels for a set of mandatory ones)_](./label-check/README.md)

### 🏷 [`labeler` _(auto-label PRs based on branch/size)_](./labeler/README.md)

### <img src=".github/icons/update-github-actions.png" height=20> [`update-github-actions` _(updates versions in composite actions and comments)_](./update-github-actions/README.md)

### <img src=".github/icons/update-outdated-prs.png" height=20> [`update-outdated-prs` _(updates out-of-date PRs merging to certain branch)_](./update-outdated-prs/README.md)
