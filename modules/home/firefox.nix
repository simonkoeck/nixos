{ pkgs, lib, inputs, nixpkgs, ... }: 
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "de" ];

    policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxAccounts = true; 
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        SearchBar = "unified"; 
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        HttpsOnlyMode = "enabled"; 
        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          UrlbarInterventions = false;
          SkipOnboarding = true;
          MoreFromMozilla = false;
        };
        FirefoxHome = {
          Search = true;
          TopSites = true; 
          SponsoredTopSites = false; 
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false; 
        };
        SearchSuggestEnabled = true; 
        FirefoxSuggest = {
           WebSuggestions = false;
           SponsoredSuggestions = false;
           ImproveSuggest = false;
        };
        PictureInPicture = {
            Enabled = false;
        };
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
                privacy-badger
            ];
        };
        settings = {
           "browser.urlbar.suggest.quicksuggest.sponsored" = false;
           "devtools.netmonitor.persistlog" = true;
           "media.ffmpeg.vaapi.enabled" = true;
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
        settings = {
           "browser.urlbar.suggest.quicksuggest.sponsored" = false;
           "devtools.netmonitor.persistlog" = true;
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
        settings = {
           "browser.urlbar.suggest.quicksuggest.sponsored" = false;
           "devtools.netmonitor.persistlog" = true;
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
      exec = "firefox -P \"BugBounty Hunting\" %U"; 
      icon = "firefox";
      terminal = false;
      categories = [ "Network" "WebBrowser" ];
    };
  };
}
