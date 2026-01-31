{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    binds = {
      movefocus_cycles_fullscreen = true;
    };

    bind = [
      "SUPER, T, exec, alacritty"
      "SUPER, C, killactive,"
      "SUPER, V, togglefloating,"
      "SUPER, R, exec, vicinae toggle"
      "SUPER, S, togglesplit, # dwindle"
      "SUPER, F, fullscreen, 1"

      # Move focus with mainMod + arrow keys
      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"
      "SUPER, k, movefocus, u"
      "SUPER, j, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
      "CTRL SHIFT, Space, exec, 1password --quick-access"

      "SUPER, I, focusmonitor, 1"
      "SUPER, U, focusmonitor, 0"
      "SUPER, O, focusmonitor, 2"

      "SUPER, b, exec, swaync-client -t"

      # Scroll through existing workspaces with mainMod + scroll
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"

      # Screenshot
      ",Print, exec, screenshot --copy"
      "SHIFT, Print, exec, screenshot --save"

      # Toggle waybar
      "SUPER, Space, exec, killall -SIGUSR1 .waybar-wrapped"

      # Special workspace keybinds
      "SUPER, m, togglespecialworkspace, music"
      "SUPER, n, togglespecialworkspace, gather"

      # Audio Hotkeys
      "SUPER ALT, 1, exec, change-audio headphones" 
      "SUPER ALT, 2, exec, change-audio box" 
      "SUPER ALT, 3, exec, change-audio internal" 
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    # mouse binding
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
