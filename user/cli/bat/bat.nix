{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = { theme = "tokyonight-storm"; };
  };

  home.file.".config/bat/themes/tokyonight-storm.tmTheme".text =
    builtins.readFile ./themes/tokyonight-storm.tmTheme;
}
