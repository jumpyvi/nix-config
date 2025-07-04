{ lib, config, pkgs, pkgsUnstable, chaotic, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/root/kde.nix
      ../../modules/root/docker.nix
      ../../modules/root/jumpyvi.nix
      ../../modules/root/nordvpn.nix
      ../../modules/root/lang.nix
      ../../modules/root/audio.nix
      ../../modules/root/sunshine.nix
      ../../modules/root/ssh.nix
      ../../modules/root/units/updates/nix-update.nix

      ## Homelab
      ../../modules/root/lab/code-server.nix
      ../../modules/root/lab/jellyfin.nix
      ../../modules/root/lab/arr.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod;

  environment.etc.crypttab = {
    mode = "0600";
    text = ''
      # <volume-name> <encrypted-device> [key-file] [options]
      games UUID=22b839d4-890d-49a8-aee2-50a862bbbda7 /root/mykeyfile.key luks
      storage UUID=6fe68377-766c-4e5e-9c49-1d569cee3bb9 /root/mykeyfile.key luks
      media UUID=8051e3fd-4114-48e5-ac51-c3bd14834b70 /root/mykeyfile.key luks
    '';
  };

  systemd.tmpfiles.rules = [
  "d /mnt/games 0755 jumpyvi user -"
  "d /mnt/media 0755 jumpyvi user -"
  "d /mnt/storage 0755 jumpyvi user -"
];


  fileSystems."/mnt/games" = {
  device = "/dev/mapper/games";
  fsType = "xfs";
  options = [ "defaults" "x-systemd.automount" ];
  };

  fileSystems."/mnt/media" = {
    device = "/dev/mapper/media";
    fsType = "xfs";
    options = [ "defaults" "x-systemd.automount" ];
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/mapper/storage";
    fsType = "xfs";
    options = [ "defaults" "x-systemd.automount" ];
  };

  system.activationScripts.createSymlinks.text = ''
    mkdir -p /home/jumpyvi

    ln -sf /mnt/games /home/jumpyvi/Games
    ln -sf /mnt/media /home/jumpyvi/Media
    ln -sf /mnt/storage /home/jumpyvi/Storage
  '';


  networking.hostName = "homelab";

  services.flatpak.enable = true;

  networking.networkmanager.enable = true;
  services.printing.enable = true;
  home-manager.backupFileExtension = "backup";

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jumpyvi";


  zramSwap.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.open = true;
#   hardware.nvidia.modesetting.enable = true;

  
  programs.steam = {
    enable = true;
    package = pkgs.steam;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      gamescope
    ];
  };


  environment.systemPackages = lib.flatten [
    (with pkgs; [
      gamemode
      tpm2-tss
      nixfmt
      nix-prefetch
      gnome-disk-utility
      nh
    ])
    (with pkgsUnstable; [
      #
    ])
  ];



  system.stateVersion = "25.05";
}
