{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = { theme = "mellow"; };
    themes = {
      mellow = {
        src = ./themes;
        file = "mellow.tmTheme";
      };
    };
  };
}
