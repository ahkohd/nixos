{ ... }: {
  services.yabai = {
    enable = true;
    config = {
      layout = "stack";
      auto_balance = "on";

      mouse_modifier = "alt";
      # set modifier + right-click drag to resize window (default: resize)
      mouse_action2 = "resize";
      # set modifier + left-click drag to resize window (default: move)
      mouse_action1 = "move";

      # gaps
      top_padding = 15;
      bottom_padding = 15;
      left_padding = 15;
      right_padding = 15;
      window_gap = 15;
    };
    extraConfig = ''
      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      # workspace management
      yabai -m space 1  --label todo
      yabai -m space 2  --label productive
      yabai -m space 3  --label chat
      yabai -m space 4  --label utils
      yabai -m space 5  --label code

      # assign apps to spaces
      yabai -m rule --add app="Reminder" space=todo
      yabai -m rule --add app="Mail" space=todo
      yabai -m rule --add app="Calendar" space=todo

      yabai -m rule --add app="Firefox" space=productive
      yabai -m rule --add app="Arc" space=productive

      yabai -m rule --add app="Ferdium" space=chat
      yabai -m rule --add app="Slack" space=chat

      yabai -m rule --add app="Spotify" space=utils
      yabai -m rule --add app="1password" space=utils
      yabai -m rule --add app="OrbStack" space=code

      yabai -m rule --add app="Ghostty" space=code
      yabai -m rule --add app="Sublime Text" space=code
    '';
  };
}
