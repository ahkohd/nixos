{ config, pkgs, inputs, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
