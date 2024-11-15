{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.inter
    pkgs.maple-mono
    (pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; })
  ];
}

