{configs, inputs, pkgs, ...}: 
{
  imports = [
    ./settings/animations.nix
    ./settings/colors.nix
    ./settings/decorations.nix
    ./settings/displays.nix
    ./settings/input.nix
    ./settings/keybinds.nix
    ./settings/misc.nix
    ./settings/plugins.nix
    ./settings/startup.nix
    ./settings/windowrules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;

  };

}
