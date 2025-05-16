
{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprgrass ];

    settings = {
      plugin = {
        touch_gestures = {
          sensitivity = 1.0;
          workspace_swipe_fingers = 3;
          workspace_swipe_edge = "d";
          long_press_delay = 400;
          resize_on_border_long_press = true;
          edge_margin = 10;
          emulate_touchpad_swipe = false;

          experimental = {
            send_cancel = 0;
          };

          # hyprgrass bindings
          "hyprgrass-bind" = [
            ", edge:r:l, workspace, +1"
            ", edge:d:u, exec, firefox"
            ", edge:l:d, exec, pactl set-sink-volume @DEFAULT_SINK@ -4%"
            ", swipe:4:d, killactive"
            ", swipe:3:ld, exec, foot"
            ", tap:3, exec, foot"
          ];

          "hyprgrass-bindm" = [
            ", longpress:2, movewindow"
            ", longpress:3, resizewindow"
          ];
        };
      };
    };
  };
}

