{ ... }:
let
  browser = "/Applications/Helium.app";
  browserAlt = "/Applications/Safari.app";
  terminal = "/Applications/Kitty.app";
  editor = "/Applications/Zed.app";
  # focusOrOpen = app: cmd:
  #   ''
  #     pid=$(pgrep -n "${app}") && osascript -e "tell app \"System Events\" to set frontmost of (process 1 whose unix id is $pid) to true" || ${cmd}'';
  # cmd - 7 : ${focusOrOpen "neovide" "${pkgs.neovide}/bin/neovide"}
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
