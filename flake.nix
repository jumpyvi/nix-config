{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    #chaotic.url = "github:jumpyvi/nyx/main";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, chaotic, home-manager, nix-flatpak, ... }@inputs :
  let
     system = "x86_64-linux";
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
      specialArgs = {
       inherit system inputs configFilesDir;
       pkgsUnstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
      };

      modules = [
        chaotic.nixosModules.default
              ./systems/magnesium/configuration.nix
        home-manager.nixosModules.home-manager
        {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.jumpyvi = import ./systems/magnesium/home.nix;
        home-manager.extraSpecialArgs = { inherit configFilesDir; };
        home-manager.sharedModules = [
              nix-flatpak.homeManagerModules.nix-flatpak
            ];
        }
      ];
	};
     };
     };
}
