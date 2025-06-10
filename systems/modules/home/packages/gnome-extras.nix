{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        gnomeExtensions.bottom-overview
        gnome-tweaks
        gnome-extension-manager
    ];

    dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
        "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "bottom-overview@fthx"
      ];
    };
  };

  gtk = {
    enable = true;
    #Icon Theme
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      };
  };
}