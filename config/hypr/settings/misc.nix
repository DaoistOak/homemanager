{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      misc = {
        vfr = true;
        vrr = 1;
        focus_on_activate = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        disable_hyprland_logo = false;
        disable_splash_rendering = false;
      };
    };
  };
}

