{
  config.virtualisation.oci-containers.containers = {
    gluetun = {
      image = "ghcr.io/qdm12/gluetun";
      ports = [
        "8888:8888/tcp" "8388:8388/tcp" "8388:8388/udp" # Gluetun
        "4301:4301" "6881:6881" "6881:6881/udp" # Qbit
        "8989:8989" # Radarr
        "9696:9696" # Prowlarr
        "8191:8191" # Flaresolverr
        ];
      capabilities = {
        NET_ADMIN = true;
      };
      environment = {
        VPN_SERVICE_PROVIDER = "nordvpn";
        VPN_TYPE = "wireguard";
        UPDATER_PERIOD = "24h";
      };
      environmentFiles = [ /home/jumpyvi/Media/configs/vpn-secret/.env.secret ];
      volumes = [
         "/home/jumpyvi/Media/configs/gluetun:/gluetun"
       ];
    };

    radarr = {
      image = "linuxserver/sonarr";
      extraOptions = [
        "--network=container:gluetun"
      ];
      environment = {
        PUID="1000";
        PGID="1000";
        TZ="Etc/UTC";
      };
      volumes = [
         "/home/jumpyvi/Media/configs/radarr:/config"
         "/home/jumpyvi/Media/tv:/tv"
         "/home/jumpyvi/Media/downloads:/downloads"
       ];
    };

    qbit = {
      image = "lscr.io/linuxserver/qbittorrent:latest";
      extraOptions = [
        "--network=container:gluetun"
      ];
      environment = {
        PUID="1000";
        PGID="1000";
        TZ="Etc/UTC";
        WEBUI_PORT="4301";
        TORRENTING_PORT="6881";
      };
      volumes = [
         "/home/jumpyvi/Media/configs/qbit:/config"
         "/home/jumpyvi/Media/downloads:/downloads"
       ];
    };

    prowlarr = {
      image = "lscr.io/linuxserver/prowlarr:latest";
      extraOptions = [
        "--network=container:gluetun"
      ];
      environment = {
        PUID="1000";
        PGID="1000";
        TZ="Etc/UTC";
      };
      volumes = [
         "/home/jumpyvi/Media/configs/prowlarr:/config"
       ];
    };

    flaresolverr = {
      image = "ghcr.io/flaresolverr/flaresolverr:latest ";
      extraOptions = [
        "--network=container:gluetun"
      ];
      environment = {
        TZ="Etc/UTC";
      };
      volumes = [
         "/home/jumpyvi/Media/configs/flaresolverr:/config"
       ];
    };
};
}