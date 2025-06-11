{ config, pkgs, ... }:

{
  imports =
    [
      ../modules/home/jumpyvi.nix
      ../modules/home/packages/always-cli.nix
      ../modules/home/packages/firefox.nix
      ../modules/home/packages/containers.nix
      ../modules/home/packages/gnome-extras.nix
      ../modules/home/packages/git.nix
    ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # nix related
    nix-output-monitor
    vscode
    ghostty
    rustic
    rclone
    vesktop

    # Gaming
    prismlauncher
  ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
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
