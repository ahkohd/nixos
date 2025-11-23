{ pkgs, ... }:
let
  browser = "/Applications/Helium.app";
  terminal = "/Applications/Ghostty.app";
  focusOrOpen = app: cmd: ''pid=$(pgrep -n "${app}") && osascript -e "tell app \"System Events\" to set frontmost of (process 1 whose unix id is $pid) to true" || ${cmd}'';
in {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      cmd - 1 : open ${browser}
      cmd - 2 : open ${terminal}
      cmd - 6 : ${focusOrOpen "neovide" "${pkgs.neovide}/bin/neovide"}
    '';
  };
}
