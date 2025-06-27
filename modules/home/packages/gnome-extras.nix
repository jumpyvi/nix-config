{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        gnomeExtensions.bottom-overview
        gnome-tweaks
        gnome-extension-manager
        gnomeExtensions.appindicator
        gnomeExtensions.fuzzy-app-search
        gnomeExtensions.pip-on-top
        adw-gtk3
    ];

    # dconf watch /
    dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "lv3:caps_switch" "altwin:swap_alt_win"];
      sources = [
        (lib.gvariant.mkTuple ["xkb" "fr+us"])
      ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,minimize:appmenu";
      num-workspaces = 4;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
    };
        "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "bottom-overview@fthx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com"
        "pip-on-top@rafostar.github.com"
      ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      toggle-fullscreen = [ "<Shift><Super>w" ];
      toggle-maximized = [ "<Super>w" ];

    };
  };

  gtk = {
    enable = true;
    #Icon Theme
    iconTheme = {
      package = pkgs.morewaita-icon-theme;
      name = "MoreWaita";
      };
  };
}