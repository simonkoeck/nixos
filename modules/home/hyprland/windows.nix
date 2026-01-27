{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Make file dialogs float
      "float,class:^(file_progress)$"
      "float,class:^(confirm)$"
      "float,class:^(dialog)$"
      "float,class:^(download)$"
      "float,class:^(notification)$"
      "float,class:^(error)$"
      "float,class:^(confirmreset)$"
      "float,title:^(Open File)$"
      "float,title:^(File Upload)$"
      "float,title:^(branchdialog)$"
      "float,title:^(Confirm to replace files)$"
      "float,title:^(File Operation Progress)$"

      # Screenshare picker
      "opacity 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"

      # Remove context menu transparency in chromium based apps
      "opaque,class:^()$,title:^()$"
      "noshadow,class:^()$,title:^()$"
      "noblur,class:^()$,title:^()$"

      # Custom window rules
      # Gather
      "workspace special:gather, class:(Gather)"
      # YouTube Music
      "workspace special:music, initialTitle:(YouTube Music)"

      "workspace 9 silent, class:^(cs2)$"
      "immediate, class:^(cs2)$"
      "fullscreen, class:^(cs2)$"
    ];

    layerrule = [
      # Vicinae launcher
      "blur,vicinae"
      "ignorealpha 0, vicinae"
      "noanim, vicinae"
      "dimaround, vicinae"

      # Add dim to notification center
      "dimaround, swaync-control-center"
    ];

    workspace = [
      # Disable gaps in fullscreen
      "f[0],rounding:false,bordersize:0,gapsout:0"
      "f[1],rounding:false,bordersize:0,gapsout:0"
      "9, monitor:DP-11"
    ];
  };
}
