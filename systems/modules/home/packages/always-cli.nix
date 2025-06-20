{ config, pkgs, configFilesDir, ... }:
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
        gccgo15
    ];

    xdg.configFile."nvim".source = configFilesDir + /cli-tools/nvim;
    xdg.configFile."fish".source = configFilesDir + /cli-tools/fish;

}