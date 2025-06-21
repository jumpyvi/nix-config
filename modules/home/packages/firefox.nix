{ config, pkgs, configFilesDir, ... }:

# Thanks to sleepynix
let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
    programs.firefox = {
        enable = true;

        profiles = {
        jumpyvi = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
          id = 0;               # 0 is the default profile; see also option "isDefault"
          name = "jumpyvi";   # name as listed in about:profiles
          isDefault = true;     # can be omitted; true if profile ID is 0
          extraConfig = builtins.readFile "${configFilesDir}/browsers/betterfox.js";
          userChrome = builtins.readFile "${configFilesDir}/browsers/firefox-style.css";
          settings = {          # specify profile-specific preferences here; check about:config for options
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "browser.startup.homepage" = "https://nixos.org";
            "browser.newtabpage.pinned" = [{
              title = "NixOS";
              url = "https://nixos.org";
            }];
            # add preferences for profile_0 here...
          };
        };
        };

        policies = {
            DisableFirefoxScreenshots = true;
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "always";

            Preferences = { 
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-true;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-true;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-true;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-true;
        };
        };

    };
}