{ ... }:
let
  browser = "/Applications/Safari.app";
  terminal = "/Applications/Ghostty.app";
  spotify = "/Applications/Spotify.app";
  chat = "/Applications/Ferdium.app";
  op = "/Applications/1Password.app";
in {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      :: default

      :: nav @ 

      cmd - h ; nav

      nav < j : if [ "$(yabai -m query --spaces --space | jq -r '.type')" = "stack" ]; then yabai -m window --focus stack.next || yabai -m window --focus stack.first; else yabai -m window --focus south; fi

      nav < k : if [ "$(yabai -m query --spaces --space | jq -r '.type')" = "stack" ]; then yabai -m window --focus stack.prev || yabai -m window --focus stack.last; else yabai -m window --focus north; fi

      nav < g : yabai -m window --focus stack.first

      nav < r : yabai -m window --focus stack.last

      nav < s : yabai -m window --swap west

      nav < d : yabai -m window --swap east

      nav < o : yabai -m window --toggle float

      nav < escape ; default  

      nav < return ; default

      :: launcher @

      hyper - 5 ; launcher

      launcher < t : open ${terminal} 

      launcher < b : open ${browser}

      launcher < s : open ${spotify}

      launcher < c : open ${chat} 

      launcher < f : open -a Finder

      launcher < p : open ${op}

      launcher < escape ; default

      launcher < return ; default
    '';
  };
}
