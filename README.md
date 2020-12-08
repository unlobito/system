# dotfiles

## Quick Start
You'll need
1. SSH keys authorised in GitLab ([user profile](https://gitlab.canidae.systems/profile/keys) / [deploy keys](https://gitlab.canidae.systems/htw/dotfiles/-/settings/repository#js-deploy-keys-settings))
2. chezmoi installed ([instructions](https://www.chezmoi.io/docs/install/))

```
chezmoi init git@gitlab.canidae.systems:htw/dotfiles.git
```
## Refresh
First, validate which changes will be made.
```
chezmoi apply --dry-run --verbose | less
```

Then, apply changes to home directory.
```
chezmoi apply | less
```
