# system

## 🏃 get started
first, authorise SSH keys in GitLab ([user profile](https://gitlab.canidae.systems/profile/keys) / [deploy keys](https://gitlab.canidae.systems/htw/system/-/settings/repository#js-deploy-keys-settings)).

second, install nix using the [DeterminateSystems one-liner](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#usage):

```
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

third, ensure nix is installed correctly:
```
$ nix run nixpkgs#hello
```

fourth, check [`flake.nix`](flake.nix): make sure there's a `darwinConfigurations` section for the current hostname

last but not least, once you're ready to commit:
```
$ nix run nix-darwin -- switch --flake .
```


## 🔧 rebuilding
after initial setup, we can use a shorter command to rebuild the system:
```
$ darwin-rebuild switch --flake .
```


## notes
### influences
* https://github.com/kclejeune/system
* https://github.com/i077/system
* https://xyno.space/post/nix-darwin-introduction
* https://nixcademy.com/2024/01/15/nix-on-macos/


### further reading
* https://daiderd.com/nix-darwin/manual/index.html
* https://nix-community.github.io/home-manager/index.xhtml
