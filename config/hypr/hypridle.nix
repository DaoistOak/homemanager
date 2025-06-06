
{ config, lib, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ~/.config/hypr/scripts/hyprlock.sh";
        before_sleep_cmd = "loginctl lock-session;";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };

      listeners = [
        {
          timeout = 150; # 2.5 minutes
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300; # 5 minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 330; # 5.5 minutes
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800; # 30 minutes
          on-timeout = "systemctl hibernate";
        }
      ];
    };
  };
}
