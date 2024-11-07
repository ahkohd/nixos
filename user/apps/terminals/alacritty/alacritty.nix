{ ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.toml".text = ''
    import = [ "~/.config/alacritty/themes/tokyonight_storm.toml" ]

    [shell]
    program = "zsh"
    args = ["-c", "nitch && exec zsh"]

    [window]
    decorations = "None"
    blur = true
    opacity = 1.0

    [window.dimensions]
    columns = 140
    lines = 38

    [window.padding]
    x = 75
    y = 70

    [font]
    size = 14

    [font.normal]
    family = "SF Mono"
    style = "Regular"

    [font.bold]
    family = "SF Mono"
    style = "Bold"

    [font.italic]
    family = "SF Mono"
    style = "Italic"

    [font.bold_italic]
    family = "SF Mono"
    style = "Bold Italic"

    [font.offset]
    x = 0
    y = 0

    [cursor.style]
    shape = "Beam"
    blinking = "Always"
  '';

  home.file.".config/alacritty/themes/tokyonight_storm.toml".source =
    ./themes/tokyonight_storm.toml;
}
