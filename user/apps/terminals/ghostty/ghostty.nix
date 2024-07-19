{ config, pkgs, ... }:

{

  home.file.".config/ghostty/config".text = ''
    font-family = Berkeley Mono

    # font-family = GeistMono Nerd Font

    font-size = 14

    window-padding-x = 20

    window-padding-y = 10

    # Theme (Nord)
    palette = 0=#3b4252
    palette = 1=#bf616a
    palette = 2=#a3be8c
    palette = 3=#ebcb8b
    palette = 4=#81a1c1
    palette = 5=#b48ead
    palette = 6=#88c0d0
    palette = 7=#e5e9f0
    palette = 8=#4c566a
    palette = 9=#bf616a
    palette = 10=#a3be8c
    palette = 11=#ebcb8b
    palette = 12=#81a1c1
    palette = 13=#b48ead
    palette = 14=#8fbcbb
    palette = 15=#eceff4
    background = 2e3440
    foreground = d8dee9
    cursor-color = eceff4
    selection-background = eceff4
    selection-foreground = 4c566a
  '';
}
