{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [ pkgs.inter pkgs.maple-mono ];
}

