{ config, pkgs, ... }:

{

  home.file.".config/ghostty/config".text = ''
    font-family = Berkeley Mono

    # font-family = GeistMono Nerd Font

    font-size = 14

    window-padding-x = 20

    window-padding-y = 10

    theme = Solarized Dark - Patched
  '';
}
