{ lib, pkgs, ... }:
{
  services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = [ "jumpyvi" ];
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "yes"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};
}
