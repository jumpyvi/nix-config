{ config, pkgs, configFilesDir, ... }:
{
    home.packages = with pkgs; [
        distrobox
        podman
        skopeo
        docker
        docker-compose
    ];

    home.file.".config/containers/policy.json".source = configFilesDir + /containers/container-policy.json;
}
