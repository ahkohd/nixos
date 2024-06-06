{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".text = ''
    import = [ "~/.config/alacritty/themes/gruvbox.toml" ]

    [shell]
    program = "zsh"

    [window]
    decorations = "None"
    blur = true
    opacity = 0.90

    [window.dimensions]
    columns = 140
    lines = 38

    [window.padding]
    x = 10
    y = 5

    [font]
    size = 12

    [font.normal]
    family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    # family = "Bitstream Vera Sans Mono"
    style = "Regular"

    [font.bold]
    family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    # family = "Bitstream Vera Sans Mono"
    style = "Bold"

    [font.italic]
    family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    # family = "Bitstream Vera Sans Mono"
    style = "Italic"

    [font.bold_italic]
    family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    # family = "Bitstream Vera Sans Mono"
    style = "Bold Italic"

    [font.offset]
    x = 0
    y = 0
  '';

  home.file.".config/alacritty/themes/gruvbox.toml".source =
    ./themes/gruvbox.toml;
}
