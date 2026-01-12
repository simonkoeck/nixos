{ pkgs, lib, inputs, nixpkgs, ... }: 
let
  commonSettings = {
    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
    "browser.urlbar.suggest.quicksuggest.nononsense" = true;
    "media.ffmpeg.vaapi.enabled" = true;
    "devtools.netmonitor.persistlog" = true;
    "browser.aboutConfig.showWarning" = false;
    "browser.compactmode.show" = true;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    "gfx.webrender.all" = true;
    "browser.cache.disk.enable" = false;
    "browser.cache.memory.enable" = true;
    "browser.cache.memory.capacity" = 524288;
    "browser.sessionstore.interval" = 1800000; # 30 mins in ms
    "toolkit.cosmeticAnimations.enabled" = false;
  };

  sharedSearch = {
    force = true;
    default = "google";
    engines = {
      "Nix Packages" = {
        urls = [{ template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}"; }];
        icon = "https://nixos.org/favicon.png";
        updateInterval = 24 * 60 * 60 * 1000;
        definedAliases = [ "@np" "np" ];
      };
      "NPM" = {
        urls = [{ template = "https://www.npmjs.com/search?q={searchTerms}"; }];
        icon = "https://static-production.npmjs.com/58a19602036db1daee0d7863c94673a4.png";
        updateInterval = 24 * 60 * 60 * 1000;
        definedAliases = [ "@npm" "npm" ];
      };
      "GitHub" = {
        urls = [{ template = "https://github.com/search?q={searchTerms}&type=repositories"; }];
        icon = "https://github.githubassets.com/favicons/favicon.svg";
        updateInterval = 24 * 60 * 60 * 1000;
        definedAliases = [ "@gh" "gh" ];
      };

      "bing".metaData.hidden = true;
      "ebay".metaData.hidden = true;
    };
  };

  otarkTheme = ''
    #navigator-toolbox { background-color: #0f2b18 !important; border-bottom: 1px solid #1a4a2a !important; }
    .tab-background[selected="true"] { background-color: #1a4a2a !important; background-image: none !important; }
    #urlbar-background { background-color: #0d1f12 !important; }
  '';

  bugBountyTheme = ''
    #navigator-toolbox { background-color: #3b1e08 !important; border-bottom: 1px solid #663300 !important; }
    .tab-background[selected="true"] { background-color: #663300 !important; background-image: none !important; }
    #urlbar-background { background-color: #261205 !important; }
  '';
in
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
        
        Certificates = {};

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
        settings = commonSettings // {
          "browser.toolbars.bookmarks.visibility" = "always";
          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
        };

        search = sharedSearch;

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
        settings = commonSettings;
        userChrome = otarkTheme;
        
        search = sharedSearch;
        
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
        settings = commonSettings // {
             "security.tls.version.min" = 1;
             "network.trr.mode" = 5; 
        };
        userChrome = bugBountyTheme;
        
        search = sharedSearch;
        
        extensions =  {
            packages = with pkgs.firefox-addons; [
                onepassword-password-manager
                foxyproxy-standard
                wappalyzer
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
      exec = "firefox -P \"BugBounty Hunting\" %U"; 
      icon = "firefox";
      terminal = false;
      categories = [ "Network" "WebBrowser" ];
    };
  };
}
