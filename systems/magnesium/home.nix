{ config, pkgs, chaotic, configFilesDir, services, nix-flatpak, ... }:

{
  imports =
    [
      ../../modules/home/packages/flatpaks.nix
      ../../modules/home/jumpyvi.nix
      ../../modules/home/packages/always-cli.nix
      ../../modules/home/packages/firefox.nix
      ../../modules/home/packages/containers.nix
      ../../modules/home/packages/gnome-extras.nix
      ../../modules/home/packages/git.nix
      ../../modules/home/packages/onedrive.nix
    ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # nix related
    nix-output-monitor

    # System
    rustic
    rclone
    equibop
    mission-center
    beeper
    fractal
    rustdesk-flutter

    # Gaming
    prismlauncher
    lutris
    gamescope

    # Text / IDE
    obsidian
    vscode-fhs
    flatpak
    ghostty

    # bazaar_git
  ];

  home.file.".config/ghostty/config".source = configFilesDir + /terminals/ghostty.conf;

  
  # chaotic.bazaar = {
  # enable = true;

  # contentConfig = ''
  #   sections:
  #     - title: "Luigi"
  #       subtitle: "You should change this with services.bazaar.extraContent"
  #       description: "These are some of my favorite apps!"
  #       rows: 3
  #       banner-fit: cover
  #       appids:
  #         - net.lutris.Lutris
  #         - org.mozilla.firefox
  #         - net.pcsx2.PCSX2
  #         - org.blender.Blender
  #         - com.modrinth.ModrinthApp
  #         - com.system76.Popsicle
  #         - com.valvesoftware.Steam
  #         - org.gimp.GIMP
  #         - org.gnome.Builder
  #         - org.gnome.Loupe
  #         - org.inkscape.Inkscape
  #         - org.kde.krita
  # '';

  #   };


  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "~/.config/nix-config/flake.nix";
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
