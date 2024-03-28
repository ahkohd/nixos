{ config, pkgs, ... }:

{
  programs.alacritty.enable = true;

  home.file.".config/alacritty/alacritty.yml".text = ''
    shell:
      program: zsh
    # env:
    #   TERM: alacritty
    window:
      decorations: None
      dimensions:
        columns: 140
        lines: 38
      opacity: 1
      padding:
        x: 10
        y: 5
    font:
      size: 14
      normal:
        # family: "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
        family: Bitstream Vera Sans Mono
        style: Regular
      bold:
        # family: "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
        family: Bitstream Vera Sans Mono
        style: Bold
      italic:
        # family: "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
        family: Bitstream Vera Sans Mono
        style: Italic
      bold_italic:
        # family: "BerkeleyMono Nerd Font Plus Font Awesome Plus Octicons Plus Codicons Plus Material Design Icons"
        family: Bitstream Vera Sans Mono
        style: Bold Italic
      offset:
        x: 0
        y: 0
    import:
      - ~/.config/alacritty/themes/modus_vivendi.yml
  '';

  home.file.".config/alacritty/themes/modus_vivendi.yml".source =
    ./themes/modus_vivendi.yml;
}
