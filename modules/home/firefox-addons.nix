{ buildFirefoxXpiAddon, lib }:

{
  hacktools = buildFirefoxXpiAddon rec {
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
  authfill = buildFirefoxXpiAddon rec {
    pname = "authfill";
    version = "1.2.0";
    addonId = "extension@authfill.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4683108/${pname}-${version}.xpi";
    sha256 = "sha256-R+mvL33hQJQlh9RfQn4JUMj+p5mVuD1XWVii+uY7xmI=";
    meta = with lib;
      {
        homepage = "https://github.com/authfill/authfill";
        description = "AuthFill is a browser extension that allows you to verify your email with one click.";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
}
