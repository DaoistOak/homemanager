{ config, pkgs,lib, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      # Window rules
      # Special scratchpad workspace

   workspace = lib.mkMerge [
    (lib.mkForce "eDP-1, 1")  # Set eDP-1 as the default workspace
    "special:scratchpad, gapsin:0, gapsout:0, on-created-empty:[fullscreen](kitty)" # Keep special workspace
  ];

      windowrule = [
        "workspace 1, alacritty"
        "workspace 2, firefox"
        "workspace 3, kate"
        "workspace 3, geany"
        "workspace 4, pcmanfm-qt"
        "workspace 4, title:^(ranger)$"
        "workspace 5, rhythmbox"
        "workspace 5, cantata"
        "workspace 5, title:^(ncmpcpp)$"
        "workspace 6, mpv"
        "workspace 7, discord"
        "workspace 7, WebCord"
        "workspace 9, title:^(htop)$"
        "workspace 9, title:^(bashtop)$"
        "float, pavucontrol"
        "float, qalculate-qt"
        "float, com.github.hluk.copyq"
        "float, title:^(Extract archive)$"
        "nomaxsize, title:^(Wine configuration)$"
        "nomaxsize, title:^(Add/Remove Programs)$"
        "float, com-group_finity-mascot-Main"
        "noblur, com-group_finity-mascot-Main"
        "nofocus, com-group_finity-mascot-Main"
        "noshadow, com-group_finity-mascot-Main"
        "noborder, com-group_finity-mascot-Main"
        "noblur,^(firefox)$"
        "rounding 14,^(firefox)$"
        "bordersize 0,^(firefox)$"
      ];

      windowrulev2 = [
        "float, class:^(xarchiver)$"
        "float, class:^(org.qbittorrent.qBittorrent)$"
        "float, class:^(lxqt-sudo)$"
        "float, class:^(pcmanfm-qt)$,title:(.*)( Properties)$"
        "float, class:^(pcmanfm-qt)$,title:^(Preferences)$"
        "float, class:^(pcmanfm-qt)$,title:^(Choose an Application)$"
        # "float, title:^(tmux)$"
        "float, class:^()$, title:^(Picture in picture)$"
        "noborder, class:^()$, title:^(Picture in picture)$"
        "pin, class:^()$, title:^(Picture in picture)$"
        "rounding 0, class:^()$, title:^(Picture in picture)$"
        "noshadow, class:^()$, title:^(Picture in picture)$"
        "float, class:^(firefox)$, title:^(Save File)$"
        "float, class:^(firefox)$, title:^(Open File)$"
        "float, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "pin, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "noborder, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "rounding 0, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "noshadow, class:^(firefox)$, title:^(Picture-in-Picture)$"
        "float, class:^(once)$, title:^(sudo)$"
        "float, class:^(steam)$, title:^(Steam)$"
        "float, class:^(waypaper)$, title:^(Waypaper)$"
        "float, class:^(pcmanfm-qt)$, title:^(Copy Files)$"
        "float, class:^(pcmanfm-qt)$, title:^(Move Files)$"
        "float, class:^(pcmanfm-qt)$, title:^(Confirm to replace files)$"
        "float, class:^(blueman-manager)$"
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float, class:^(nm-connection-editor)$"
        "float, class:^(xdg-desktop-portal-hyprland)$"
        # "immediate, class:^(steam_app)$"  # Tearing
      ];

      # Layer rules
      layerrule = [
        "ignorezero, swaync-control-center"
        "ignorezero, avizo"
        "ignorezero, waybar"
        "ignorezero, rofi"
      ];
    };
  };
}

