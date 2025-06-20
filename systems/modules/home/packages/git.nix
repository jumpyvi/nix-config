{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        github-desktop
    ];

    programs.git = {
        enable = true;
        userName = "JumpyVi";
        userEmail = "jumpyvi@outlook.com";
        extraConfig = {
            core = {
              editor = "code --wait";
            };
	                
        };
    };
}