{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".text = ''
    import = [ "~/.config/alacritty/themes/oceanic_next.toml" ]

    [shell]
    program = "zsh"

    [window]
    decorations = "None"
    opacity = 1

    [window.dimensions]
    columns = 140
    lines = 38

    [window.padding]
    x = 10
    y = 5

    [font]
    size = 14

    [font.normal]
    family = "Bitstream Vera Sans Mono"
    style = "Regular"

    [font.bold]
    family = "Bitstream Vera Sans Mono"
    style = "Bold"

    [font.italic]
    family = "Bitstream Vera Sans Mono"
    style = "Italic"

    [font.bold_italic]
    family = "Bitstream Vera Sans Mono"
    style = "Bold Italic"

    [font.offset]
    x = 0
    y = 0
  '';

  home.file.".config/alacritty/themes/oceanic_next.toml".source =
    ./themes/oceanic_next.toml;
}
