{ colorscheme, ... }:

let theme = if colorscheme == "light" then "cyberdream-light" else "cyberdream";
in {
  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    inherit theme;
    model = "anthropic/claude-opus-4-5";
    autoupdate = true;
    share = "disabled";
    keybinds = {
      leader = "ctrl+a";
      messages_half_page_up = "ctrl+u";
      messages_half_page_down = "ctrl+d";
      messages_first = "ctrl+g";
      messages_last = "ctrl+l";
    };
  };

  home.file.".config/opencode/themes".source = ./themes;
  home.file.".config/opencode/AGENTS.md".source = ./AGENTS.md;
  home.file.".config/opencode/command".source = ./command;
}

