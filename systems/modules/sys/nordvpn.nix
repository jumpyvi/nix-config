{ lib, pkgs, chaotic, ... }:
{
  users.users.jumpyvi.extraGroups = [ "nordvpn" ];
  environment.systemPackages = with pkgs; [
     nordvpn
  ];
  #environment.etc."hosts".enable = false;

  environment.etc.hosts.mode = "0644";

  chaotic.nordvpn.enable = true;
  networking.firewall.checkReversePath = false;
  networking.firewall = {
   enable = true;
   allowedTCPPorts = [1194];
   allowedUDPPorts = [443];
  };
}