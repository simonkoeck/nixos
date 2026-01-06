{ pkgs, ... }:

let
  pname = "liquid-launcher";
  version = "0.5.0";

  src = pkgs.fetchurl {
    url = "https://github.com/CCBlueX/LiquidLauncher/releases/download/v${version}/LiquidLauncher_${version}_amd64.AppImage";
    hash = "sha256-7gYRY4B6u1YYs5tUkNyLpM7o2hu35HKjuVLn5RCLXMw=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    # 1. Extract and install the desktop file
    desktopFile=$(find ${appimageContents} -maxdepth 1 -name "*.desktop" | head -n 1)
    install -m 444 -D "$desktopFile" $out/share/applications/${pname}.desktop

    # 2. Fix the Desktop Entry
    # We remove TryExec and point Exec directly to the Nix store path
    sed -i '/^TryExec/d' $out/share/applications/${pname}.desktop
    sed -i "s|^Exec=.*|Exec=$out/bin/${pname} %U|" $out/share/applications/${pname}.desktop
    sed -i "s|^Icon=.*|Icon=${pname}|" $out/share/applications/${pname}.desktop

    # 3. Install the icon
    iconFile=$(find ${appimageContents} -name "*.png" | grep -v "128x128" | head -n 1)
    if [ -n "$iconFile" ]; then
      install -m 444 -D "$iconFile" $out/share/icons/hicolor/512x512/apps/${pname}.png
    fi

    # 4. The Wrapper
    # This replaces the need for the 'nvidia-offload' script by setting 
    # the variables directly, making the desktop entry much more stable.
    source "${pkgs.makeWrapper}/nix-support/setup-hook"
    
    wrapProgram $out/bin/${pname} \
      --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.mesa-demos ]} \
      --set __NV_PRIME_RENDER_OFFLOAD 1 \
      --set __GLX_VENDOR_LIBRARY_NAME nvidia \
      --set __VK_LAYER_NV_optimus NVIDIA_only \
      --set GDK_BACKEND x11 \
      --set WEBKIT_DISABLE_COMPOSITING_MODE 1
  '';

  extraPkgs = pkgs: with pkgs; [
    webkitgtk_4_1
    gtk3
    cairo
    gdk-pixbuf
    glib
    libsoup_3
    libGL
    vulkan-loader
  ];
}
