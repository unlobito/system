# Justfile heavily adapted from @i077 - https://github.com/i077/system/

# Build & activate this host's profile
switch: fmt fast-switch

# Switch without running checks/formatting, for rapid iteration
fast-switch:
    darwin-rebuild --flake .#$(just get-name) switch

# Format files, and ask to amend last commit if changes are present
fmt:
  nixpkgs-fmt .

fmt-check: 
  nixpkgs-fmt --check .

# Diff this host's closure in the flake against its current one
diff:
    nix build ".#darwinConfigurations.$(just get-name).system" -o ./new-system
    nvd --color always diff /run/current-system ./new-system | less -FR
    rm ./new-system

# Start a REPL with flake outputs
repl:
    @nix repl --expr 'let \
        flake = builtins.getFlake "'$(pwd)'"; \
        pkgs = flake.inputs.nixpkgs.legacyPackages.${builtins.currentSystem}; in \
        { inherit flake pkgs; inherit (pkgs) lib; configs = flake.darwinConfigurations // flake.nixosConfigurations; }'

# Build this host's profile
build:
    darwin-rebuild --flake .#$(just get-name) build

check: fmt-check

# Garbage-collect the Nix store
gc age='60':
    sudo nix-collect-garbage --delete-older-than {{ age }}d
    nix-collect-garbage

# Get name of config to apply, overriden with .hostname file
[private]
@get-name:
    [[ -f .hostname ]] && cat .hostname || hostname
