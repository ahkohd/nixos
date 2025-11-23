{ ... }: {
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      vsync = true;
      frame = "transparent";
      srgb = true;
      font = {
        normal = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        bold = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        italic = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        bold_italic = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        size = 40;
        features = { "TX-02-AREMU" = [ "-calt" "-liga" "-dlig" ]; };
      };
    };
  };
}
