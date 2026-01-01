{ pkgs, ... }:

let
  pname = "liquid-launcher";
  version = "0.5.0"; # Check the GitHub releases page for the latest version

  src = pkgs.fetchurl {
    # LiquidLauncher releases follow this naming pattern
    url = "https://github.com/CCBlueX/LiquidLauncher/releases/download/v${version}/LiquidLauncher_${version}_amd64.AppImage";
    # Run 'nix build' once. It will fail and give you the correct hash. 
    # Replace the zeros below with that hash.
    hash = "sha256-7gYRY4B6u1YYs5tUkNyLpM7o2hu35HKjuVLn5RCLXMw=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    # 1. Locate the desktop file
    desktopFile=$(find ${appimageContents} -maxdepth 1 -name "*.desktop" | head -n 1)

    # 2. Install it to the standard location
    install -m 444 -D "$desktopFile" $out/share/applications/${pname}.desktop

    # 3. FORCE correct the Exec and Icon lines
    # We remove TryExec entirely because it often points to 'AppRun' which doesn't exist here
    sed -i '/^TryExec/d' $out/share/applications/${pname}.desktop
    
    # Force the Exec line to use our binary name
    sed -i "s|^Exec=.*|Exec=${pname} %U|" $out/share/applications/${pname}.desktop
    
    # Force the Icon line to use our icon name
    sed -i "s|^Icon=.*|Icon=${pname}|" $out/share/applications/${pname}.desktop

    # 4. Find and install the icon
    iconFile=$(find ${appimageContents} -name "*.png" | grep -v "128x128" | head -n 1)
    if [ -n "$iconFile" ]; then
      install -m 444 -D "$iconFile" $out/share/icons/hicolor/512x512/apps/${pname}.png
    fi

    # 5. Wrap the binary (Wayland support)
    source "${pkgs.makeWrapper}/nix-support/setup-hook"
    wrapProgram $out/bin/${pname} \
      --set GDK_BACKEND x11 \
      --set WEBKIT_DISABLE_COMPOSITING_MODE 1
  '';

  extraPkgs = pkgs: with pkgs; [
    # Tauri / WebKitGTK dependencies often needed by AppImages
    webkitgtk_4_1
    gtk3
    cairo
    gdk-pixbuf
    glib
    libsoup_3
  ];
}
