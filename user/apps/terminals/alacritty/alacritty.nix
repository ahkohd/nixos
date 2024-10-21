{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".text = ''
    import = [ "~/.config/alacritty/themes/tokyonight_storm.toml" ]

    [shell]
    program = "fish"

    [window]
    decorations = "None"
    # blur = true
    # opacity = 1.0

    [window.dimensions]
    columns = 140
    lines = 38

    [window.padding]
    x = 15
    y = 10

    [font]
    size = 24

    [font.normal]
    # family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    family = "GeistMono Nerd Font"
    style = "Regular"

    [font.bold]
    # family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    family = "GeistMono Nerd Font"
    style = "Bold"

    [font.italic]
    # family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    family = "GeistMono Nerd Font Mono"
    style = "Italic"

    [font.bold_italic]
    # family = "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
    family = "GeistMono Nerd Font Mono"
    style = "Bold Italic"

    [font.offset]
    x = 0
    y = 0
  '';

  home.file.".config/alacritty/themes/tokyonight_storm.toml".source =
    ./themes/tokyonight_storm.toml;
}
