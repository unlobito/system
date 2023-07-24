# dotfiles

## Quick Start
You'll need
1. SSH keys authorised in GitLab ([user profile](https://gitlab.canidae.systems/profile/keys) / [deploy keys](https://gitlab.canidae.systems/htw/dotfiles/-/settings/repository#js-deploy-keys-settings))
2. Homebrew installed ((install)[https://brew.sh/])
3. chezmoi installed (`$ brew install chezmoi`)

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
### Homebrew
Check formula missing on system
```
brew bundle check -v --file .Brewfile
```

Install formula from Brewfile
```
brew bundle install -v --file .Brewfile
```

Check formula installed not in Brewfile
```
# Needs --force to actually perform, see --help
brew bundle cleanup --file .Brewfile
```
