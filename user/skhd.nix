{ ... }:

let
  browser = "/Applications/Safari.app";
  altBrowser = "/Applications/Google\\ Chrome.app";
  terminal = "/Applications/Ghostty.app";
  spotify = "/Applications/Spotify.app";
  slack = "/Applications/Slack.app";
  discord = "/Applications/Discord.app";
  notes = "/Applications/Obsidian.app";
  op = "/Applications/1Password.app";
  chatgpt = "/Applications/ChatGPT.app";
in {

  home.file."/.skhdrc".text = ''
    :: default : borders active_color=0x00000000 

    :: launcher : borders active_color=0xFFF64F9E

    hyper - 5 ; launcher

    launcher < t : open ${terminal} 

    launcher < b : open ${browser}

    launcher < a : open ${altBrowser}

    launcher < m : open ${spotify}

    launcher < c : open ${chatgpt} 

    launcher < s : open ${slack} 

    launcher < d : open ${discord} 

    launcher < f : open -a Finder

    launcher < p : open ${op}

    launcher < n : open ${notes}

    launcher < escape ; default 

    launcher < return ; default
  '';
}
