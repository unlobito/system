{
  description = "nix system flake";

  inputs = {
    # packages
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # systems
    nixos-hardware.url = "github:nixos/nixos-hardware";
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
    , nixos-unstable
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
      nixosConfigurations.nixos = nixos-unstable.lib.nixosSystem {
        # NOTE: Change this to aarch64-linux if you are on ARM
        system = "x86_64-linux";
        modules = [
          ./profiles/personal.nix
          ./modules/hardware/thonkpad.nix
          ./modules/nixos/thonkpad.nix
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t410
          home-manager.nixosModules.home-manager
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
    };
}
