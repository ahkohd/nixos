{ config, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_material_dark";
      theme_background = true;
    };
  };
}
