{ ... }: {
  nix.settings = {
    # Necessary for using flakes on this system.
    experimental-features = "nix-command flakes";
  };

  programs.zsh.enable = true;
}
