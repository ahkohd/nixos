{ ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        font = "SF Pro Display 11.0";
        allow_markup = true;
        frame_width = 2;
        corner_radius = 12;
        horizontal_padding = 12;
      };

      # TokyoNight colors for dunst
      # For more configuration options see https://github.com/dunst-project/dunst/blob/master/dunstrc
      urgency_low = {
        background = "#1f2335";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
      };

      urgency_normal = {
        background = "#24283b";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
      };

      urgency_critical = {
        background = "#292e42";
        foreground = "#db4b4b";
        frame_color = "#db4b4b";
      };
    };
  };
}
