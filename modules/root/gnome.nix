{ lib, config, pkgs, ... }:
{

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
      epiphany    # web browser
      simple-scan # document scanner
      yelp        # help viewer
      geary       # email client
      seahorse    # password manager
      gnome-console # terminal emulator

      # these should be self explanatory
      gnome-calendar gnome-characters gnome-clocks gnome-contacts
      gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-photos
      gnome-system-monitor pkgs.gnome-connections
    ];

  services.gnome.gnome-keyring.enable = true;

}