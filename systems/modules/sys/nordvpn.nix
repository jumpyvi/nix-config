{ lib, pkgs, chaotic, ... }:
{
  users.users.jumpyvi.extraGroups = [ "nordvpn" ];
  environment.systemPackages = with pkgs; [
     nordvpn
  ];
  environment.etc."hosts".enable = false;

  system.activationScripts.ensureEtcHosts.text = ''
    if [ ! -e /etc/hosts ]; then
      echo "Creating default /etc/hosts"
      cat > /etc/hosts <<EOF
127.0.0.1       localhost
::1             localhost
EOF
    fi
  '';

  chaotic.nordvpn.enable = true;
  networking.firewall.checkReversePath = false;
  networking.firewall = {
   enable = true;
   allowedTCPPorts = [1194];
   allowedUDPPorts = [443];
  };
}