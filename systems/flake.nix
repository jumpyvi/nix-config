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
	  specialArgs = {inherit system inputs; };

	  modules = [
	    chaotic.nixosModules.default
      ./magnesium/configuration.nix
	    home-manager.nixosModules.home-manager
	    {
	     home-manager.useGlobalPkgs = true;
	     home-manager.useUserPackages = true;
	     home-manager.users.jumpyvi = import ./magnesium/home.nix;
	    }
	  ];
	};
     };
     };
}
