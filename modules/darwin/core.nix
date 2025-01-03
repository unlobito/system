{ nix-vscode-extensions, ... }: {
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;
  # bash is enabled by default

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  nix.settings = {
    # Necessary for using flakes on this system.
    experimental-features = "nix-command flakes";

    substituters = [
      "https://devenv.cachix.org"
      "https://cache.lix.systems"
    ];

    trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      nix-vscode-extensions.overlays.default
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
