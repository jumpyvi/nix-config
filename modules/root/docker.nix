{ pkgs, ... }:
{
    virtualisation.docker.enable = true;
    users.users.jumpyvi.extraGroups = [ "docker" ];
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    virtualisation.oci-containers.backend = "docker";
    

    systemd.services.docker.serviceConfig = {
    ExecStartPost = [
      "${pkgs.coreutils}/bin/chown jumpyvi:docker /var/run/docker.sock"
    ];
  };
    
    services.xserver.displayManager.sessionCommands = ''
    xhost +si:localuser:$(whoami) > /dev/null
  '';

}