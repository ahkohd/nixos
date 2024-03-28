{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = { theme = "ansi"; };
  };
}
