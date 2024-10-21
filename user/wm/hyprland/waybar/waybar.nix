{ ... }: {

  programs.waybar = { enable = true; };

  home.file.".config/waybar/config".source = ./config.json;

  home.file.".config/waybar/modules".source = ./modules.json;

  home.file.".config/waybar/style.css".source = ./style.css;

}
