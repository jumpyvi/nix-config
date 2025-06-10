{ config, pkgs, ... }:
{
    environment.systemPackages = [
        pkgs.virglrenderer
        pkgs.virt-manager
    ];

    users.groups.libvirtd.members = ["jumpyvi"];

    virtualisation.libvirtd = {
        enable = true;
        qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    users.users.jumpyvi.extraGroups = [ "libvirtd" ];

    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;

}