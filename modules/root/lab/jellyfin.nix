{
  config.virtualisation.oci-containers.containers = {
    jellyfin = {
      image = "linuxserver/jellyfin:latest";
      ports = ["8096:8096"];
      environment = {
        PUID = "1000";
        PGID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
         "/home/jumpyvi/Media/movies:/movies"
         "/home/jumpyvi/Media/tv:/tv"
         "/home/jumpyvi/Media/configs/jellyfin:/config"
       ];
    };
};
}