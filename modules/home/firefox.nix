{ pkgs, lib, inputs, nixpkgs, ... }: 
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "de" ];

    policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        # DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        # DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
    };

    profiles.personal = {
        id = 0;
        name = "Personal";
        isDefault = true;
        settings = {
          "browser.toolbars.bookmarks.visibility" = "always";
        };
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Toolbar";
              toolbar = true; 
              bookmarks = [
                {
                  name = "GitHub";
                  bookmarks = [
                     { name = "ShipSecure"; url = "https://github.com/shipsecure-labs"; }
                     { name = "simonkoeck"; url = "https://github.com/simonkoeck"; }
                  ];
                }
                { name = "YouTube"; url = "https://youtube.com/"; }
              ];
            }
          ];
        };
        extensions =  {
            packages = with pkgs.firefox-addons; [
                ublock-origin
                onepassword-password-manager
                pwas-for-firefox
                sponsorblock
                youtube-shorts-block
            ];
        };
    };
    profiles.otark = {
        id = 1;
        name = "Otark";
        extensions =  {
            packages = with pkgs.firefox-addons; [
                ublock-origin
                onepassword-password-manager
                pwas-for-firefox
            ];
        };
    };
    profiles.bugbounty = {
        id = 2; 
        name = "BugBounty Hunting";
        extensions =  {
            packages = with pkgs.firefox-addons; [
                onepassword-password-manager
            ];
        };
    };

    nativeMessagingHosts = [ pkgs.firefoxpwa ];
  };
}
