{ lib, config, pkgs, ... }:
{

  home.packages = with pkgs; [
        onedrive
        onedrivegui
    ];
  programs.onedrive.settings = {
    check_nomount = "false";
    check_nosync = "false";
    classify_as_big_delete = "1000";
    cleanup_local_files = "true";
    disable_notifications = "false";
    no_remote_delete = "false";
    use_recycle_bin = "true";
    sync_dir = "~/OneDrive";
    rate_limit = "5";
    resync = "false";
    skip_dotfiles = "false";
    resync_auth = "true";
    skip_file = "*.tmp|*.swp|*.partial";
    skip_dir = "Apps|Archives|Attachments|Backups";
  };

}