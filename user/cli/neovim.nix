{ config, pkgs, lib, home, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaPackages = p: [ p.magick ];
    extraPackages = with pkgs; [ imagemagick ];
  };
}