{ config, pkgs, chaotic, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../modules/sys/gnome.nix
      ../modules/sys/docker.nix
      ../modules/sys/jumpyvi.nix
      ../modules/sys/nordvpn.nix
      ../modules/sys/virt.nix
      ../modules/sys/lang.nix
      ../modules/sys/audio.nix
      ../modules/sys/units/updates/nix-update.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  networking.hostName = "magnesium";

  networking.networkmanager.enable = true;
  services.printing.enable = true;
  home-manager.backupFileExtension = "backup";

  environment.systemPackages = with pkgs; [
     gamemode
     tpm2-tss
  ];

  nixpkgs.config.packagesOverrides = pkgs:{
    nordvpn = pkgs.callPackage /home/jumpyvi/.nix-system/systems/magnesium/nord.nix { };
  };


  system.stateVersion = "25.05";
}
