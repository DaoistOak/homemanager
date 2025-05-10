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
  catppuccin.flavor="macchiato";
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
    hyprshade
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
  ];



  # # Theming
  # gtk = {
  #   theme = {
  #     name = "catppuccin-gtk";
  #     package = pkgs.catppuccin-gtk.override {
  #       accents = [ "mauve" ];
  #       variant = "macchiato";
  #     };
  #   };
  #     iconTheme.name = "Papirus-Dark";
  # };
  #
  # qt = {
  #   platformTheme.name = "gtk"; # Ensures Qt apps follow the GTK theme
  #   style = {
  #     name = "kvantum-dark";
  #     package = pkgs.catppuccin-kde.override {
  #       accents = [ "mauve" ];
  #     };
  #   };
  # };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Include the keyboard LED control module
}
