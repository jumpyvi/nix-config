{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        fastfetch
        xz
        unzip
        p7zip
        fish
        htop
        neovim
        ripgrep
        eza
        fzf
        which
        gnused
        gnutar
        gawk
        gnupg
    ];
}