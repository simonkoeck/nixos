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

  xdg.desktopEntries = {
    
    firefox-otark = {
      name = "Firefox Otark";
      genericName = "Web Browser";
      exec = "firefox -P Otark %U";
      icon = "firefox";
      terminal = false;
      categories = [ "Network" "WebBrowser" ];
    };

    firefox-bugbounty = {
      name = "Firefox BugBounty";
      genericName = "Web Browser";
      # FIX BELOW: Use escaped double quotes \" instead of single quotes '
      exec = "firefox -P \"BugBounty Hunting\" %U"; 
      icon = "firefox";
      terminal = false;
      # Removed deprecated "Application" to silence the warning
      categories = [ "Network" "WebBrowser" ];
    };
  };
}
