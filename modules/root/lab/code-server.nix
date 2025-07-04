{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
     code-server
    ];

  services.code-server = {
    enable = true;
    port = 4444;
    host = "0.0.0.0";
    auth = "none";
    user = "jumpyvi";
    disableUpdateCheck = true;
  };

  networking.firewall.allowedTCPPorts = [ 4444 ];
}  
  
  