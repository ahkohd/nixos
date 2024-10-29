{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    shell = "${pkgs.fish}/bin/fish";
    plugins = with pkgs; [ tmuxPlugins.sensible ];
    extraConfig = ''
      # undercurl support

      set -sg terminal-overrides ",*:RGB"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm' # enable undercurl colors
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m' # set undercurl color


      # layout & colors

      set -g status-right ""
      set -g status-right-length 100
      set -g status-left-length 50
      set -g status-position top

      set -g status-left "#[fg=#ffffff,bold]⚡#{session_name}  "
      set -g window-status-format "#[fg=#D0D0D0,bg=default][#I]"
      set -g window-status-current-format "#[fg=#ffffff,bg=default, bold]#W"
      set -g status-style fg=#D0D0D0,bg=default


      # others

      # Enable vi mode for tmux

      # See: https://blog.sanctum.geek.nz/vi-mode-in-tmux/
      set-window-option -g mode-keys vi
      # Support visual selection
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      # Support 'yank'
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-Space' if-shell \"$is_vim\" 'send-keys C-Space'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-Space' if-shell \"$is_vim\" 'send-keys C-Space'  'select-pane -l'"

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-Space' select-pane -l
    '';
  };
}
