{
  description = "nix system flake";

  inputs = {
    # packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # systems
    nixos-hardware.url = "github:nixos/nixos-hardware";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.3-2.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , lix-module
    , darwin
    , home-manager
    , ...
    } @ inputs: {
      darwinConfigurations."bobloblaw" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./profiles/personal.nix
          ./modules/hardware/bobloblaw.nix
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
          lix-module.nixosModules.default
        ];
      };
      darwinConfigurations."lupe" = darwin.lib.darwinSystem {
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
          lix-module.nixosModules.default
        ];
      };
      darwinConfigurations."M-LY5DPFDJKJ" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./profiles/work.nix
          ./modules/hardware/M-LY5DPFDJKJ.nix
          ./modules/darwin/work
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.harleywatson = import ./modules/home-manager;
          }
          lix-module.nixosModules.default
        ];
      };
      nixosConfigurations.thonkpad = nixpkgs.lib.nixosSystem {
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
          lix-module.nixosModules.default
        ];
      };
    };
}
