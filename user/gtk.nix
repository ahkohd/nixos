{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adwaita";
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = { name = "adwaita"; };
    style = { name = "adwaita-dark"; };
  };
}
