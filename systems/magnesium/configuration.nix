{ config, pkgs, chaotic, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/root/gnome.nix
      ../../modules/root/docker.nix
      ../../modules/root/jumpyvi.nix
      ../../modules/root/nordvpn.nix
      ../../modules/root/virt.nix
      ../../modules/root/lang.nix
      ../../modules/root/audio.nix
      ../../modules/root/units/updates/nix-update.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  networking.hostName = "magnesium";

  networking.networkmanager.enable = true;
  services.printing.enable = true;
  home-manager.backupFileExtension = "backup";

  zramSwap.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];


  environment.systemPackages = with pkgs; [
     gamemode
     tpm2-tss
     nixfmt
     nautilus-python
     code-nautilus
  ];

  system.stateVersion = "25.05";
}
