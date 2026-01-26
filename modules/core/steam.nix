{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # Run using gamescope --backend sdl --prefer-vk-device 1 
  # Cs start options env --unset=LD_LIBRARY_PATH gamescope --backend sdl --prefer-vk-device 1 -- %command% -vulkan
  # env --unset=LD_LIBRARY_PATH gamemoderun gamescope --backend sdl --prefer-vk-device 1 --force-grab-cursor --fullscreen -W 1920 -H 1080 -w 1280 -h 960 -r 60 -- %command% -vulkan
  # env --unset=LD_LIBRARY_PATH gamescope --rt --backend sdl --prefer-vk-device 1 --force-grab-cursor --fullscreen -W 1920 -H 1080 -w 1920 -h 1080 -r 60 -- %command% -vulkan -width 1920 -height 1080
  # VARIANT X11: env --unset=LD_LIBRARY_PATH SDL_VIDEODRIVER=x11 gamescope --rt --backend sdl --prefer-vk-device 1 --immediate-flips --force-grab-cursor --fullscreen -W 1920 -H 1080 -w 1920 -h 1080 -r 60 -- %command% -vulkan -width 1920 -height 1080 +fps_max 0
  # env --unset=LD_LIBRARY_PATH gamescope --rt --immediate-flips --backend sdl --prefer-vk-device 1 --force-grab-cursor --fullscreen -W 1920 -H 1080 -w 1920 -h 1080 -r 60 -- %command% -vulkan -width 1920 -height 1080
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

}
