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
    cwd = { fg = "#6bdfff" }

    # Hovered
    hovered = { reversed = true }
    preview_hovered = { underline = true }

    # Find
    find_keyword = { fg = "#ffa14f", bold = true, italic = true, underline = true }
    find_position = { fg = "#ff7ab2", bg = "reset", bold = true, italic = true }

    # Marker
    marker_copied = { fg = "#acf2e4", bg = "#acf2e4" }
    marker_cut = { fg = "#ff8170", bg = "#ff8170" }
    marker_marked = { fg = "#6bdfff", bg = "#6bdfff" }
    marker_selected = { fg = "#ffa14f", bg = "#ffa14f" }

    # Tab
    tab_active = { reversed = true }
    tab_inactive = {}
    tab_width = 1

    # Count
    count_copied = { fg = "#292a30", bg = "#acf2e4" }
    count_cut = { fg = "#292a30", bg = "#ff8170" }
    count_selected = { fg = "#292a30", bg = "#ffa14f" }

    # Border
    border_symbol = "│"
    border_style = { fg = "#7f8c98" }

    # : }}}


    # : Status {{{

    [status]
    separator_open = ""
    separator_close = ""
    separator_style = { fg = "#414453", bg = "#414453" }

    # Mode
    mode_normal = { fg = "#292a30", bg = "#4eb0cc", bold = true }
    mode_select = { fg = "#292a30", bg = "#acf2e4", bold = true }
    mode_unset = { fg = "#292a30", bg = "#dfdfe0", bold = true }

    # Progress
    progress_label = { fg = "#dfdfe0", bold = true }
    progress_normal = { fg = "#4eb0cc", bg = "#414453" }
    progress_error = { fg = "#ff8170", bg = "#414453" }

    # Permissions
    permissions_t = { fg = "#4eb0cc" }
    permissions_r = { fg = "#ffa14f" }
    permissions_w = { fg = "#ff8170" }
    permissions_x = { fg = "#acf2e4" }
    permissions_s = { fg = "#7f8c98" }

    # : }}}


    # : Select {{{

    [select]
    border = { fg = "#4eb0cc" }
    active = { fg = "#ff7ab2", bold = true }
    inactive = {}

    # : }}}


    # : Input {{{

    [input]
    border = { fg = "#4eb0cc" }
    title = {}
    value = {}
    selected = { reversed = true }

    # : }}}


    # : Completion {{{

    [completion]
    border = { fg = "#4eb0cc" }

    # : }}}


    # : Tasks {{{

    [tasks]
    border = { fg = "#4eb0cc" }
    title = {}
    hovered = { fg = "#ff7ab2", underline = true }

    # : }}}


    # : Which {{{

    [which]
    mask = { bg = "#414453" }
    cand = { fg = "#6bdfff" }
    rest = { fg = "#dfdfe0" }
    desc = { fg = "#ff7ab2" }
    separator = "  "
    separator_style = { fg = "#7f8c98" }

    # : }}}


    # : Help {{{

    [help]
    on = { fg = "#6bdfff" }
    run = { fg = "#ff7ab2" }
    hovered = { reversed = true, bold = true }
    footer = { fg = "#414453", bg = "#dfdfe0" }

    # : }}}


    # : Notify {{{

    [notify]
    title_info = { fg = "#acf2e4" }
    title_warn = { fg = "#ffa14f" }
    title_error = { fg = "#ff8170" }

    # : }}}


    # : File-specific styles {{{

    [filetype]

    rules = [
      # Images
      { mime = "image/*", fg = "#6bdfff" },

      # Media
      { mime = "{audio,video}/*", fg = "#ffa14f" },

      # Archives
      { mime = "application/*zip", fg = "#ff7ab2" },
      { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#ff7ab2" },

      # Documents
      { mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#acf2e4" },

      # Fallback
      { name = "*", fg = "#dfdfe0" },
      { name = "*/", fg = "#4eb0cc" },
    ]

    # : }}}
  '';
}
