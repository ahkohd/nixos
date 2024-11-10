{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages =
    [ pkgs.inter (pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; }) ];
}

