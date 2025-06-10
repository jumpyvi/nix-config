{
    systemd.timers."update-nix" = {
        wantedBy = [ "timers.target" ];
            timerConfig = {
            OnCalendar = "Sun *-*-* 10:00:00 America/New_York";
            Unit = "update-nix.service";
            };
    };

    systemd.services."update-nix" = {
        script = ''
            set -eu

            export FLAKE_PATH="/home/jumpyvi/.nix-system/systems"
            export HOSTNAME="$(hostname)"

            echo "Updating flake inputs..."
            nix flake update --flake "$FLAKE_PATH"

            echo "Rebuilding system..."
            nixos-rebuild boot --flake "$FLAKE_PATH#$HOSTNAME"

            echo "System update complete."
        '';
        serviceConfig = {
            Type = "oneshot";
            User = "root";
            RemainAfterExit = true;
        };
    };
}