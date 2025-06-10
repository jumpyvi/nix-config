{ lib, pkgs, chaotic, ... }:
{
  users.users.jumpyvi.extraGroups = [ "nordvpn" ];
  environment.systemPackages = with pkgs; [
     nordvpn
  ];

  chaotic.nordvpn.enable = true;
  networking.firewall.checkReversePath = false;
  networking.firewall = {
   enable = true;
   allowedTCPPorts = [1194];
   allowedUDPPorts = [443];
  };
}