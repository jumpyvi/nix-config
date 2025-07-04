{ lib, config, pkgs, pkgsUnstable, chaotic, ... }:

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

  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  #boot.kernelPackages = pkgs.linuxPackages_cachyos;
  #services.scx.enable = true;
  #services.scx.scheduler = "scx_rusty";

  networking.hostName = "magnesium";

  services.flatpak.enable = true;

  networking.networkmanager.enable = true;
  services.printing.enable = true;
  home-manager.backupFileExtension = "backup";

  zramSwap.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  
  programs.steam = {
    enable = true;
    package = pkgs.steam;
    extraPackages = with pkgs; [
      gamescope
    ];
  };


  environment.systemPackages = lib.flatten [
    (with pkgs; [
      gamemode
      tpm2-tss
      nixfmt
      nautilus-python
      code-nautilus
      nix-prefetch
    ])
    (with pkgsUnstable; [
      #
    ])
  ];



  system.stateVersion = "25.05";
}
