{ ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".text = ''
    [general]
    import = [ "~/.config/alacritty/themes/tokyonight_storm.toml" ]

    [terminal.shell]
    program = "zsh"

    [window]
    decorations = "None"
    blur = true
    opacity = 1.0

    [window.dimensions]
    columns = 140
    lines = 38

    [window.padding]
    x = 5

    [font]
    size = 14

    [font.normal]
    family = "Maple Mono"
    style = "Regular"

    [font.bold]
    family = "Maple Mono"
    style = "Bold"

    [font.italic]
    family = "Maple Mono"
    style = "Italic"

    [font.bold_italic]
    family = "Maple Mono"
    style = "Bold Italic"

    [cursor.style]
    shape = "Beam"
    blinking = "Always"
  '';

  home.file.".config/alacritty/themes/tokyonight_storm.toml".source =
    ./themes/tokyonight_storm.toml;
}
