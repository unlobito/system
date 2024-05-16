# system

## get started (on macOS) 🏃
first, authorise SSH keys in GitLab ([user profile](https://gitlab.canidae.systems/profile/keys) / [deploy keys](https://gitlab.canidae.systems/htw/system/-/settings/repository#js-deploy-keys-settings)).

second, install Lix using the [one-liner](https://lix.systems/install/):

```bash
$ curl -sSf -L https://install.lix.systems/lix | sh -s -- install
```

third, ensure Lix is installed correctly:
```bash
$ nix run nixpkgs#hello
```

fourth, check [`flake.nix`](flake.nix): make sure there's a `darwinConfigurations` section for the current hostname

last, but not least, once you're ready to commit:
```bash
$ nix run nix-darwin -- switch --flake .
```


### rebuilding 🔧
after initial setup, we can use a shorter command to rebuild the system:
```bash
$ darwin-rebuild switch --flake .
```


#### Homebrew
Formulae are managed by nix-darwin's [homebrew](https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.brews) module, mostly through [`modules/darwin/brew.nix`](modules/darwin/brew.nix).

[`homebrew.global.brewfile`](https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.global.brewfile) is enabled, permitting use of [`brew bundle`](https://docs.brew.sh/Manpage#bundle-subcommand) to preview missing packages against the current state.

List dependencies that haven't been installed:
```bash
$ brew bundle check -v
```

List unexpected installed dependencies:
```bash
# Needs --force to actually cleanup, see --help
$ brew bundle cleanup
```


## get started (on NixOS) 🏃
first, [download and install NixOS](https://nixos.org/download/).

second, authorise SSH keys in GitLab ([user profile](https://gitlab.canidae.systems/profile/keys) / [deploy keys](https://gitlab.canidae.systems/htw/system/-/settings/repository#js-deploy-keys-settings)).

third, move `/etc/nixos` to our home directory:
```bash
$ sudo mv /etc/nixos ~/system && sudo chown -R $USER ~/system
```

fourth, gently initialise the git repository while preserving `nixos-generate-config` output:
```bash
# this could probably be less convoluted?
$ mv {hardware-configuration.nix,configuration.nix} ..
$ git init && git remote add origin git@gitlab.canidae.systems:htw/system.git && git fetch origin
$ git reset --hard origin/main
$ mv ../hardware-configuration.nix ./modules/hardware/$(hostname).nix
```

fifth, check [`flake.nix`](flake.nix): make sure there's a `nixosConfigurations` section for the current hostname (use `../configuration.nix` as a reference)

last, but not least, once you're ready to commit:
```bash
$ sudo nixos-rebuild switch --flake .
```


## notes
### influences
* https://github.com/kclejeune/system
* https://github.com/i077/system
* https://xyno.space/post/nix-darwin-introduction
* https://nixcademy.com/2024/01/15/nix-on-macos/
* https://nixos.asia/en/nixos-install-flake


### further reading
* https://daiderd.com/nix-darwin/manual/index.html
* https://nix-community.github.io/home-manager/index.xhtml
* https://lix.systems/resources/
* https://docs.lix.systems/manual/nightly/
