{ config, pkgs, inputs, ... }:

let
  spicetify = import ./pkgs/spicetify.nix { inherit pkgs inputs; };
  fabricPkg = inputs.fabric.packages.${pkgs.system}.default;
in
{
  imports = [
    ./config/hypr/hyprland.nix
  ];
  home.username = "zeph";
  home.homeDirectory = "/home/zeph";
  gtk.enable = true;
  qt.enable = true;
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    spicetify
    zellij
    hollywood
    kicad-small
    qbittorrent
    python3
    python3Packages.pip
    fabricPkg
    cairo
    # hyprland
    ags
    waybar
    waypaper
    copyq
    avizo 
    rofi
    swww
    networkmanager_dmenu
    networkmanager
    direnv
    mangohud
    hyprpanel
    libgtop
    bluez
    bluez-tools
    dart-sass
    wl-clipboard
    upower
    gvfs
    pcmanfm
    hyprlock
    hyprprop
    hyprnome
    hyprpolkitagent
    hyprsunset
    grim
    hypridle
  ];



   # Theming
   gtk = {
    theme = {
      name = "catppuccin-macchiato-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "macchiato";
      };
    };
      iconTheme.name = "Papirus-Dark";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE   = "Catppuccin-Macchiato";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = true;
  # Include the keyboard LED control module
}
