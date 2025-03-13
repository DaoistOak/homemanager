{ config, pkgs, ... }:

{
  systemd.user.services.keyboardLedControl = {
    description = "Keyboard LED Control";  # This should be fine
    wantedBy = [ "default.target" ];

    serviceConfig.ExecStart = "${pkgs.bash}/bin/bash ${./keyboard_led_control.sh}";
    serviceConfig.Type = "simple";
    serviceConfig.Restart = "always";
  };
}

