{
  description = "nix system flake";

  inputs = {
    # NOTE: Replace "nixos-23.11" with that which is in system.stateVersion of
    # configuration.nix. You can also use latter versions if you wish to
    # upgrade.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , darwin
    , home-manager
    , ...
    } @ inputs: {
      darwinConfigurations."bobloblaw" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./profiles/personal.nix
          ./modules/darwin/personal
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.htw = {
              imports = [
                (import ./modules/home-manager/personal)
                (import ./modules/home-manager)
              ];
            };
          }
        ];
      };
      darwinConfigurations."M-LY5DPFDJKJ" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./profiles/work.nix
          ./modules/darwin/work
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.harleywatson = import ./modules/home-manager;
          }
        ];
      };
      # NOTE: 'nixos' is the default hostname set by the installer
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        # NOTE: Change this to aarch64-linux if you are on ARM
        system = "x86_64-linux";
        modules = [
          ./modules/hardware/thonkpad.nix
          ./modules/nixos/thonkpad.nix
          {
            nix = {
              settings.experimental-features = [ "nix-command" "flakes" ];
            };
          }
        ];
      };
    };
}
