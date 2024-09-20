{ config, pkgs, ... }:

{

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      show_symlink = true;
      manager = { show_hidden = true; };
    };
  };

  home.file.".config/yazi/theme.toml".text = ''
        # vim:fileencoding=utf-8:foldmethod=marker

    # : Manager {{{

    [manager]
    cwd = { fg = "#2aa198" }

    # Hovered
    hovered = { reversed = true }
    preview_hovered = { underline = true }

    # Find
    find_keyword = { fg = "#b58900", bold = true, italic = true, underline = true }
    find_position = { fg = "#d33682", bg = "reset", bold = true, italic = true }

    # Marker
    marker_copied = { fg = "#859900", bg = "#859900" }
    marker_cut = { fg = "#dc322f", bg = "#dc322f" }
    marker_marked = { fg = "#2aa198", bg = "#2aa198" }
    marker_selected = { fg = "#b58900", bg = "#b58900" }

    # Tab
    tab_active = { reversed = true }
    tab_inactive = {}
    tab_width = 1

    # Count
    count_copied = { fg = "#002b36", bg = "#859900" }
    count_cut = { fg = "#002b36", bg = "#dc322f" }
    count_selected = { fg = "#002b36", bg = "#b58900" }

    # Border
    border_symbol = "│"
    border_style = { fg = "#586e75" }

    # : }}}


    # : Status {{{

    [status]
    separator_open = ""
    separator_close = ""
    separator_style = { fg = "#073642", bg = "#073642" }

    # Mode
    mode_normal = { fg = "#002b36", bg = "#268bd2", bold = true }
    mode_select = { fg = "#002b36", bg = "#859900", bold = true }
    mode_unset = { fg = "#002b36", bg = "#eee8d5", bold = true }

    # Progress
    progress_label = { fg = "#fdf6e3", bold = true }
    progress_normal = { fg = "#268bd2", bg = "#073642" }
    progress_error = { fg = "#dc322f", bg = "#073642" }

    # Permissions
    permissions_t = { fg = "#268bd2" }
    permissions_r = { fg = "#b58900" }
    permissions_w = { fg = "#dc322f" }
    permissions_x = { fg = "#859900" }
    permissions_s = { fg = "#586e75" }

    # : }}}


    # : Select {{{

    [select]
    border = { fg = "#268bd2" }
    active = { fg = "#d33682", bold = true }
    inactive = {}

    # : }}}


    # : Input {{{

    [input]
    border = { fg = "#268bd2" }
    title = {}
    value = {}
    selected = { reversed = true }

    # : }}}


    # : Completion {{{

    [completion]
    border = { fg = "#268bd2" }

    # : }}}


    # : Tasks {{{

    [tasks]
    border = { fg = "#268bd2" }
    title = {}
    hovered = { fg = "#d33682", underline = true }

    # : }}}


    # : Which {{{

    [which]
    mask = { bg = "#073642" }
    cand = { fg = "#2aa198" }
    rest = { fg = "#839496" }
    desc = { fg = "#d33682" }
    separator = "  "
    separator_style = { fg = "#586e75" }

    # : }}}


    # : Help {{{

    [help]
    on = { fg = "#2aa198" }
    run = { fg = "#d33682" }
    hovered = { reversed = true, bold = true }
    footer = { fg = "#073642", bg = "#93a1a1" }

    # : }}}


    # : Notify {{{

    [notify]
    title_info = { fg = "#859900" }
    title_warn = { fg = "#b58900" }
    title_error = { fg = "#dc322f" }

    # : }}}


    # : File-specific styles {{{

    [filetype]

    rules = [
      # Images
      { mime = "image/*", fg = "#2aa198" },

      # Media
      { mime = "{audio,video}/*", fg = "#b58900" },

      # Archives
      { mime = "application/*zip", fg = "#d33682" },
      { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#d33682" },

      # Documents
      { mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#859900" },

      # Fallback
      { name = "*", fg = "#93a1a1" },
      { name = "*/", fg = "#268bd2" },
    ]

    # : }}}
  '';
}
