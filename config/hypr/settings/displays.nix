{ config, pkgs, ... }:

{
  # Display setup for laptop

  wayland.windowManager.hyprland = {
  settings = {
    monitor = "eDP-1, 1920x1200@60, auto, 1";
    workspace = "eDP-1, 1";

    # Monitor at home (currently commented out in the original config)
    # monitor= "DP-2, 1920x1080@75, auto, 1";
    # workspace= "DP-2, 1";

    # Projector setup
    #monitor = "HDMI-A-1, 1920x1200@60, auto, 1, mirror, eDP-1";
    # workspace= "HDMI-A-1, 1, mirror, eDP-1";

    # For random monitor (default to preferred and auto mode)
    #monitor = ", preferred, auto, 1";
  };
  };
}
