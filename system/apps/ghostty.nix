{ system, ghostty, ... }:

let gsty = ghostty.packages.${system}.default;

in {
  environment.systemPackages = [ gsty ];

  home.file.".config/ghostty/config".text = ''
    font-family = GeistMono Nerd Font

    font-size = 15

    theme = Nord

    window-padding-x = 20

    window-padding-y = 10
  '';
}
