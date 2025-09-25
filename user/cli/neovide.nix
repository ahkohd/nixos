{ ... }: {
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      frame = "transparent";
      vsync = true;
      srgb = true;
      font = {
        normal = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        bold = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        italic = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        bold_italic = [ "TX-02-AREMU" "Symbols Nerd Font Mono" ];
        size = 14;
        features = { "TX-02-AREMU" = [ "-calt" "-liga" "-dlig" ]; };
      };
    };
  };
}
