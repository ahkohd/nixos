{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 32;
    x11.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
  };
}
