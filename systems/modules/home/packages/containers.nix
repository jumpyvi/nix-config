{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        distrobox
        podman
        skopeo
        docker
        docker-compose
    ];
}
