{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    cycle = true;
    font = "Bitstream Vera Sans 14";
    plugins = with pkgs; [ rofi-calc ];
    extraConfig = {
      modi = "drun,window,calc";
      show-icons = true;
    };
    theme = ./rofi.rasi;
  };
}
