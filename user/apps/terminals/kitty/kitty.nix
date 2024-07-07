{ config, pkgs, ... }:

{
  programs.kitty.enable = true;

  programs.kitty.extraConfig = ''
    font_size 14.0
    font_family GeistMono Nerd Font Mono
    bold_font GeistMono Nerd Font Mono
    italic_font GeistMono Nerd Font Mono
    bold_italic_font GeistMono Nerd Font Mono

    window_padding_width 0

    include themes/nord.conf
  '';

  home.file.".config/kitty/themes/nord.conf".source = ./themes/nord.conf;
}
