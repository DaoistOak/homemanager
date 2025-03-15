{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    
    bind =
      [
        # Show Keybinds
        "$mod, K, exec, kitty nvim $XDG_CONFIG_HOME/hypr/conf/keybinds/keybinds.conf"
        # Scroll through workspaces with super+scroll wheel
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"

        # Mouse actions
        "$mod, mouse:272, movewindow"
        # "$mod, mouse:273, resizewindow"

        # Basic actions
        "$mod, C, killactive"
        "$mod SHIFT, C, exec, hyprctl kill"
        "$mod SHIFT, F, fullscreen"
        "$mod CONTROL, F, togglefloating"
        "$mod SHIFT, P, pseudo"

        # Change focus with super+arrows
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Change window orientation with supershift+arrows
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        # Change active window size with superctrl+arrows
        "$mod CONTROL, left, resizeactive, -50 0"
        "$mod CONTROL, right, resizeactive, 50 0"
        "$mod CONTROL, up, resizeactive, 0 -50"
        "$mod CONTROL, down, resizeactive, 0 50"

        # Media and volume controls
        ", XF86PowerOff, exec, ~/.config/hypr/rofi/script/powermenu.sh"
        ", XF86AudioRaiseVolume, exec, volumectl -du up"
        ", XF86AudioLowerVolume, exec, volumectl -du down"
        ", XF86AudioMute, exec, volumectl -d toggle-mute"
        ", XF86AudioMicMute, exec, volumectl -m toggle-mute"
        ", XF86MonBrightnessUp, exec, lightctl -d up"
        ", XF86MonBrightnessDown, exec, lightctl -d down"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"

        # Screenshot
        ", Print, exec, ~/bin/screenshot"

        # Colorpicker
        "$mod ALT, P, exec, ~/bin/colorpicker"

        # Screenlock
        "$mod, L, exec, ~/.config/hypr/scripts/hyprlock.sh"

        # Clipboard
        "$mod, V, exec, copyq menu"

        # Launch programs
        "$mod, RETURN, exec, kitty"
        "$mod, F, exec, pcmanfm-qt"
        "$mod, H, exec, kitty htop"
        "$mod ALT, H, exec, kitty btop"
        "$mod, M, exec, spotify"
        "$mod ALT, RETURN, exec, alacritty"
        "$mod, W, exec, flatpak run app.zen_browser.zen"
        "$mod CONTROL, W, exec, firefox -P minimalfox"
        "$mod ALT, W, exec, qutebrowser"
        "$mod SHIFT, W, exec, firefox --private-window"
        "$mod, E, exec, cursor"
        "$mod ALT, E, exec, featherpad"
        "$mod ALT, F, exec, pcmanfm"
        "$mod ALT, M, exec, cantata"
        "$mod, Z, exec, zathura"
        "$mod, P, exec, keepassxc"
        "$mod, G, exec, steam"

        # Other applications
        "$mod, N, exec, swaync-client -t -sw"
        "$mod, SUPER_L, exec, ~/.config/hypr/rofi/script/launcher.sh"
        "$mod, B, exec, ~/.config/hypr/rofi/script/bluetooth.sh"
        "$mod, Period, exec, ~/.config/hypr/rofi/script/emoji.sh"
        "$mod, X, exec, ~/.config/hypr/rofi/script/powermenu.sh"
        "$mod, T, exec, ~/.config/hypr/rofi/script/todo.sh"
        "$mod, D, exec, waypaper"
        "$mod ALT, N, exec, networkmanager_dmenu"

        # Passthrough
        "$mod SHIFT, Escape, submap, passthru"
        "$mod, Escape, submap, reset"

        # Special workspace bindings
        "$mod SHIFT, S, movetoworkspace, special"
        "$mod, SPACE, togglespecialworkspace, scratchpad"
      ]
      ++ (
        # workspaces
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
}
