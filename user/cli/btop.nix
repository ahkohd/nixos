{ config, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "solarized_dark";
      theme_background = false;
    };
  };
}
