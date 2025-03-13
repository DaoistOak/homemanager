{ config, pkgs, inputs, ... }:

let
  spicetify = import ./pkgs/spicetify.nix { inherit pkgs inputs; };
  fabricPkg = inputs.fabric.packages.${pkgs.system}.default;
in
{
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
    rofi-wayland
    waybar
    networkmanager_dmenu
    swww
    waypaper
     udis86
    libxkbcommon
    libuuid
    pango
    mesa
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Include the keyboard LED control module
}
