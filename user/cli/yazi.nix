{ config, pkgs, ... }:

{

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = { show_symlink = true; };
  };

  home.file.".config/yazi/theme.toml".text = ''
    # Nordic Colorscheme for Yazi.
    # Based on https://github.com/AlexvZyl/nordic.nvim
    # Author: @ahkohd

              [colors]
              foreground    = "#D8DEE9"
              background    = "#242933"
              cursor_bg     = "#D8DEE9"
              cursor_border = "#D8DEE9"
              cursor_fg     = "#242933"
              selection_fg  = "#D8DEE9"
              selection_bg  = "#2E3440"

              ansi          = [ "#191D24", "#BF616A", "#A3BE8C", "#EBCB8B", "#81A1C1",  "#B48EAD", "#8FBCBB", "#D8DEE9" ]
              brights       = [ "#3B4252", "#D06F79", "#B1D196", "#F0D399", "#88C0D0",  "#C895BF", "#93CCDC", "#E5E9F0" ]

    # : Manager {{{

              [manager]
              cwd = { fg = "#D8DEE9" }

    # Hovered
              hovered         = { reversed = true }
              preview_hovered = { underline = true }

    # Find
              find_keyword  = { fg = "#EBCB8B", bold = true, italic = true, underline = true }
              find_position = { fg = "#B48EAD", bg = "reset", bold = true, italic = true }

    # Marker
              marker_copied   = { fg = "#B1D196", bg = "#B1D196" }
              marker_cut      = { fg = "#BF616A", bg = "#BF616A" }
              marker_marked   = { fg = "#D8DEE9", bg = "#D8DEE9" }
              marker_selected = { fg = "#EBCB8B", bg = "#EBCB8B" }

    # Tab
              tab_active   = { reversed = true }
              tab_inactive = {}
              tab_width    = 1

    # Count
              count_copied   = { fg = "#191D24", bg = "#B1D196" }
              count_cut      = { fg = "#191D24", bg = "#BF616A" }
              count_selected = { fg = "#191D24", bg = "#EBCB8B" }

    # Border
              border_symbol = "│"
              border_style  = { fg = "#8FBCBB" }

    # : }}}

    # : Status {{{

              [status]
              separator_open  = ""
              separator_close = ""
              separator_style = { fg = "#3B4252", bg = "#3B4252" }

    # Mode
              mode_normal = { fg = "#191D24", bg = "#88C0D0", bold = true }
              mode_select = { fg = "#191D24", bg = "#B1D196", bold = true }
              mode_unset  = { fg = "#191D24", bg = "#D06F79", bold = true }

    # Progress
              progress_label  = { fg = "#D8DEE9", bold = true }
              progress_normal = { fg = "#88C0D0", bg = "#3B4252" }
              progress_error  = { fg = "#BF616A", bg = "#3B4252" }

    # Permissions
              permissions_t = { fg = "#88C0D0" }
              permissions_r = { fg = "#EBCB8B" }
              permissions_w = { fg = "#BF616A" }
              permissions_x = { fg = "#B1D196" }
              permissions_s = { fg = "#8FBCBB" }

    # : }}}

    # : Select {{{

              [select]
              border   = { fg = "#88C0D0" }
              active   = { fg = "#B48EAD", bold = true }
              inactive = {}

    # : }}}

    # : Input {{{

              [input]
              border   = { fg = "#88C0D0" }
              title    = {}
              value    = {}
              selected = { reversed = true }

    # : }}}

    # : Completion {{{

              [completion]
              border = { fg = "#88C0D0" }

    # : }}}

    # : Tasks {{{

              [tasks]
              border  = { fg = "#88C0D0" }
              title   = {}
              hovered = { fg = "#B48EAD", underline = true }

    # : }}}

    # : Which {{{

              [which]
              mask            = { bg = "#242933" }
              cand            = { fg = "#D8DEE9" }
              rest            = { fg = "#D8DEE9" }
              desc            = { fg = "#EBCB8B" }
              separator       = "  "
              separator_style = { fg = "#2E3440" }

    # : }}}

    # : Help {{{

              [help]
              on      = { fg = "#D8DEE9" }
              run     = { fg = "#EBCB8B" }
              hovered = { reversed = true, bold = true }
              footer  = { fg = "#3B4252", bg = "#E5E9F0" }

    # : }}}

    # : Notify {{{

              [notify]
              title_info  = { fg = "#B1D196" }
              title_warn  = { fg = "#EBCB8B" }
              title_error = { fg = "#BF616A" }

    # : }}}

    # : File-specific styles {{{

              [filetype]

              rules = [
                # Images
                { mime = "image/*", fg = "#D8DEE9" },

                # Media
                { mime = "{audio,video}/*", fg = "#EBCB8B" },

                # Archives
                { mime = "application/*zip", fg = "#B48EAD" },
                { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#B48EAD" },

                # Documents
                { mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#B1D196" },

                # Fallback
                { name = "*", fg = "#E5E9F0" },
                { name = "*/", fg = "#88C0D0" }
              ]

    # : }}}

  '';
}
