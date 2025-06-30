{ config, pkgs, chaotic, configFilesDir, services, nix-flatpak, ... }:

{
  imports =
    [
      ../../modules/home/jumpyvi.nix
      ../../modules/home/packages/always-cli.nix
      ../../modules/home/packages/firefox.nix
      ../../modules/home/packages/containers.nix
    ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # nix related
    nix-output-monitor

    # Gaming
    lutris
    gamescope

    # Text / IDE
    ghostty
  ];

  home.file.".config/ghostty/config".source = configFilesDir + /terminals/ghostty.conf;

  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
