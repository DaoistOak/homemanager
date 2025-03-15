{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
  settings = {

    plugin = {
      # hyprwinwrap {
      #     # class is an EXACT match and NOT a regex!
      #     class = kitty-bg
      # }
    };
  # Hyprwinwrap
  # bind = SUPERSHIFT, D, exec, ~/.config/hypr/scripts/toggle-cava-bg
  };
  };
}
