{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, home-manager, ... }@inputs :
  let
     system = "x86_64_linux";
     configFilesDir = ./config-files;

     pkgs = import nixpkgs {
      inherit system;
      config = {
      	allowUnfree = true;
      };
     };

  in
     {
    nixosConfigurations = {
    magnesium = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit system inputs configFilesDir; };

      modules = [
        chaotic.nixosModules.default
              ./systems/magnesium/configuration.nix
        home-manager.nixosModules.home-manager
        {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.jumpyvi = import ./systems/magnesium/home.nix;
        home-manager.extraSpecialArgs = { inherit configFilesDir; };
        }
      ];
	};
     };
     };
}
