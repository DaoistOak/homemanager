{configs, inputs, pkgs, ...}: 
{
  imports = [
    ./themes/catppuccin-macchiato-auto.nix
  ];
  wayland.windowManager.hyprland.settings = {
  source = [
      "~/.config/hypr/themes/catppuccin-macchiato-auto"
    ];
  };
}
