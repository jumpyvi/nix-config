{ lib, pkgs, ... }:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.nordvpn = {};
  users.users.jumpyvi = {
    isNormalUser = true;
    description = "Vincent Laperle";
    extraGroups = [ "networkmanager" "wheel" "docker" "nordvpn"];
    shell = pkgs.bash;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}