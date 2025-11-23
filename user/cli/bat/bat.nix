{ colorscheme, ... }:

let theme = if colorscheme == "light" then "cyberdream-light" else "cyberdream";
in {
  programs.bat = {
    enable = true;
    config = { inherit theme; };
    themes = {
      cyberdream = { src = ./themes/cyberdream.tmTheme; };
      cyberdream-light = { src = ./themes/cyberdream-light.tmTheme; };
    };
  };
}
