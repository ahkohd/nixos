{ config, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "nord";
      theme_background = false;
    };
  };
}
