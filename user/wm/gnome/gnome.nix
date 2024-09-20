{ lib, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        pop-shell.extensionUuid
        blur-my-shell.extensionUuid
        hide-top-bar.extensionUuid
        unite.extensionUuid
      ];
    };
  };
}
