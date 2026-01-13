{ buildFirefoxXpiAddon, lib }:

{
  hacktools= buildFirefoxXpiAddon rec {
    pname = "hacktools";
    version = "0.4.0";
    addonId = "{f1423c11-a4e2-4709-a0f8-6d6a68c83d08}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3901885/${pname}-${version}.xpi";
    sha256 = "sha256-ls+tGchR5MN4jr407KeiaEFMPPZCE3Ez8wpsP8vM7+M=";
    meta = with lib;
      {
        homepage = "https://github.com/LasCC/HackTools";
        description = "The all-in-one browser extension for offensive security professionals";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
}
