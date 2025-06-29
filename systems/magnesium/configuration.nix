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
      #bazaar
    ])
    (with pkgsUnstable; [
      #
    ])
  ];

  nixpkgs.config.packageOverrides = pkgs: {
     #bazaar = pkgsUnstable.callPackage ./deriv/default.nix { };
  };

  # services.bazaar = {
  #   enable = true;
  #   blocklist = ''
  #     org.gnu.emacs
  #     '';

  #   contentConfig = ''
  #     sections:
  #       - title: "Mine"
  #         subtitle: "You should change this with services.bazaar.extraContent"
  #         description: "These are some of my favorite apps!"
  #         rows: 3
  #         banner-fit: cover
  #         appids:
  #           - net.lutris.Lutris
  #           - org.mozilla.firefox
  #           - net.pcsx2.PCSX2
  #           - org.blender.Blender
  #           - com.modrinth.ModrinthApp
  #           - com.system76.Popsicle
  #           - com.valvesoftware.Steam
  #           - org.gimp.GIMP
  #           - org.gnome.Builder
  #           - org.gnome.Loupe
  #           - org.inkscape.Inkscape
  #           - org.kde.krita
  #   '';

  # };





  system.stateVersion = "25.05";
}
