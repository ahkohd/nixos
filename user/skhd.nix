{ ... }:

let
  browser = "/Applications/Safari.app";
  altBrowser = "/Applications/Arc.app";
  terminal = "/Applications/Ghostty.app";
  spotify = "/Applications/Spotify.app";
  chat = "/Applications/Ferdium.app";
  notes = "/Applications/Obsidian.app";
  op = "/Applications/1Password.app";
  chatgpt = "/Applications/ChatGPT.app";
in {

  home.file."/.skhdrc".text = ''
    :: default : borders active_color=0x00000000 

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

    :: launcher : borders active_color=0xFFFFFFFF

    hyper - 5 ; launcher

    launcher < t : open ${terminal} 

    launcher < b : open ${browser}

    launcher < a : open ${altBrowser}

    launcher < m : open ${spotify}

    launcher < c : open ${chatgpt} 

    launcher < f : open -a Finder

    launcher < p : open ${op}

    launcher < n : open ${notes}

    launcher < escape ; default 

    launcher < return ; default
  '';
}
