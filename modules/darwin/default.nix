{ ... }: {
  imports = [
    ../common.nix
    ./brew.nix
    ./core.nix
    ./preferences.nix
  ];
}
