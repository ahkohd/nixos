{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-Storm";
      package = pkgs.tokyonight-gtk-theme.override {
        colorVariants = [ "dark" ];
        tweakVariants = [ "storm" ];
        iconVariants = [ "Dark" ];
      };
    };
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
