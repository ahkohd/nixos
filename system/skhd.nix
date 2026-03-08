{ ... }:
let
  browser = "/Applications/Helium.app";
  browserAlt = "/Applications/Safari.app";
  terminal = "/Applications/Kitty.app";
  editor = "/Applications/Zed.app";
in {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      cmd - 1 : open ${browser}
      cmd - 2 : open ${terminal}
      cmd - 6 : open ${browserAlt}
      cmd - 7 : open ${editor}
    '';
  };
}
