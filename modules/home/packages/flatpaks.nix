{ lib, nix-flatpak, ... }:
{
    services.flatpak.uninstallUnmanaged = true;
    services.flatpak.update.onActivation = true;

    services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub";
    location = "https://flathub.org/repo/flathub.flatpakrepo";
  }];

    services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    ];

    services.flatpak.overrides = {
    global = {
      Context = {
        filesystems = [
          "/nix/store:ro"
        ];
      };

      Environment = {
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
      };
    };
  };
}