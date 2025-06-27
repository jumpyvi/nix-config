{ config, inputs, ... }:
{
    system.autoUpgrade = {
        enable = true;
        flake = inputs.self.outPath;
        flags = [
        "--update-input"
        "nixpkgs"
        "--no-write-lock-file"
        "-L"
        ];
        operation = "boot";
        dates = "Sun 03:00";
        randomizedDelaySec = "45min";
    };

    nix.gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 3d";
    };
}