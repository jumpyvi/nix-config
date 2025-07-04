{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
     sunshine
  ];

  services.sunshine.enable = true;
  services.sunshine.capSysAdmin = true;
  services.sunshine.openFirewall = true;
  services.sunshine.autoStart = true;

}
