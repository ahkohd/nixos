{ lib, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          pop-shell.extensionUuid
          # blur-my-shell.extensionUuid
          hide-top-bar.extensionUuid
          unite.extensionUuid
        ];
      };
      # See: https://github.com/GNOME/gsettings-desktop-schemas/blob/master/schemas/org.gnome.desktop.wm.keybindings.gschema.xml.in 
      "org/gnome/desktop/wm/keybindings" = { minimize = [ ]; };
    };

  };
}
