{
  description = "nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    darwin,
    home-manager,
    ...
  } @ inputs: {
    darwinConfigurations."bobloblaw" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        ./profiles/personal.nix
        ./modules/darwin
        home-manager.darwinModules.home-manager {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.htw = import ./modules/home-manager;
        }
      ];
    };
  };
}
