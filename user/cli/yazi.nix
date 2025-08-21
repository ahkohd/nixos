{ pkgs, ... }:

{

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      show_symlink = true;
      mgr = { show_hidden = true; };
      plugin = {
        prepend_previewers = [
          {
            name = "*/";
            run = "eza-preview";
          }
          {
            name = "*.md";
            run = "glow";
          }
        ];
      };
    };
  };

  home.file.".config/yazi/plugins/eza-preview.yazi".source =
    pkgs.fetchFromGitHub {
      owner = "ahkohd";
      repo = "eza-preview.yazi";
      rev = "a97cf55e3c55dc6ae7f57823fe085a48a6723bb1";
      sha256 = "sha256-yVsv332N4OExvP4hERiDV753YWRyyfycD4iPMCtyXdE=";
    };

  home.file.".config/yazi/plugins/glow.yazi".source = pkgs.fetchFromGitHub {
    owner = "Reledia";
    repo = "glow.yazi";
    rev = "5ce76dc92ddd0dcef36e76c0986919fda3db3cf5";
    sha256 = "sha256-UljcrXXO5DZbufRfavBkiNV3IGUNct31RxCujRzC9D4=";
  };

  home.file.".config/yazi/plugins/no-status.yazi".source =
    pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "63f9650e522336e0010261dcd0ffb0bf114cf912";
      sha256 = "sha256-ZCLJ6BjMAj64/zM606qxnmzl2la4dvO/F5QFicBEYfU=";
    } + "/no-status.yazi";

  home.file.".config/yazi/keymap.toml".text = ''
    [mgr]
    prepend_keymap = [
      { on = [ "e", "t" ], run = "plugin eza-preview",  desc = "Toggle tree/list dir preview" },
      { on = [ "e", "-" ], run = "plugin eza-preview inc-level", desc = "Increment tree level" },
      { on = [ "e", "_" ], run = "plugin eza-preview dec-level", desc = "Decrement tree level" },
      { on = [ "e", "$" ], run = "plugin eza-preview toggle-follow-symlinks", desc = "Toggle tree follow symlinks" },
      { on = [ "e", "*" ], run = "plugin eza-preview toggle-hidden", desc = "Toggle hidden files" },
      { on = [ "e", "g", "i" ], run = "plugin eza-preview toggle-git-ignore", desc = "Toggle .gitignore files" },
      { on = [ "e", "g", "s" ], run = "plugin eza-preview toggle-git-status", desc = "Toggle showing git status" },
    ]
  '';

  home.file.".config/yazi/init.lua".text = ''
    require("eza-preview"):setup{
      level = 2,
      follow_symlinks = true,
      dereference = false,
      all = true
    }

    require("no-status"):setup()
  '';

  home.file.".config/yazi/theme.toml".text = ''
    [mgr]
    # NOTE: can combined with tmTheme (sublime colorshceme file) for preview code highlight
    # syntect_theme = "path/to/tmTheme"

    cwd = { fg = "#859ba2", italic = true }

    # Hovered
    hovered = { bg = "#424242" }
    preview_hovered = { bg = "#424242" }

    # Find
    find_keyword = { fg = "#101010", bg = "#ced4df", bold = true }
    find_position = { fg = "#c7cdd8", bg = "#424242", bold = true }

    # Marker
    marker_copied = { fg = "#7b9198", bg = "#7b9198" }
    marker_cut = { fg = "#eee8d5", bg = "#eee8d5" }
    marker_marked = { fg = "#DAD4C3", bg = "#DAD4C3" }
    marker_selected = { fg = "#ced4df", bg = "#ced4df" }

    # Tab
    tab_active = { fg = "#c7cdd8", bg = "#424242" }
    tab_inactive = { fg = "#838383", bg = "#101010" }
    tab_width = 1

    # Count
    count_copied = { fg = "#c7cdd8", bg = "#7b9198" }
    count_cut = { fg = "#c7cdd8", bg = "#838383" }
    count_selected = { fg = "#c7cdd8", bg = "#859ba2" }

    # Border
    border_symbol = "│"
    border_style = { fg = "#859ba2" }

    [mode]
    normal_main = { fg = "#101010", bg = "#ced4df", bold = true }
    normal_alt = { fg = "#ced4df", bg = "#424242" }

    select_main = { fg = "#101010", bg = "#DAD4C3", bold = true }
    select_alt = { fg = "#DAD4C3", bg = "#424242" }

    unset_main = { fg = "#101010", bg = "#DFDFDA", bold = true }
    unset_alt = { fg = "#DFDFDA", bg = "#424242" }

    [status]
    separator_open = ""
    separator_close = ""
    # separator_style = { fg = "#424242", bg = "#424242" }

    # Progress
    progress_label = { fg = "#c7cdd8", bold = true }
    progress_normal = { fg = "#424242" }
    progress_error = { fg = "#eee8d5" }

    # Permissions
    perm_type = { fg = "#ced4df" }
    perm_read = { fg = "#859ba2" }
    perm_write = { fg = "#eee8d5" }
    perm_exec = { fg = "#7b9198" }
    perm_sep = { fg = "#838383" }

    [pick]
    border = { fg = "#859ba2" }
    active = { fg = "#c7cdd8", bg = "#424242" }
    inactive = { fg = "#c7cdd8" }

    # Input
    [input]
    border = { fg = "#ced4df" }
    title = { fg = "#ced4df" }
    value = { fg = "#DAD4C3" }
    selected = { bg = "#424242" }

    # Completion
    [completion]
    border = { fg = "#ced4df" }
    active = { fg = "#c7cdd8", bg = "#424242" }
    inactive = { fg = "#c7cdd8" }

    icon_file = ""
    icon_folder = ""
    icon_command = ""

    # Tasks
    [tasks]
    border = { fg = "#859ba2" }
    title = { fg = "#859ba2" }
    hovered = { fg = "#c7cdd8", bg = "#424242" }

    # Which
    [which]
    cols = 3
    mask = { bg = "#101010" }
    cand = { fg = "#DFDFDA" }
    rest = { fg = "#ced4df" }
    desc = { fg = "#DAD4C3" }
    separator = " ➜ "
    separator_style = { fg = "#838383" }

    # Confirm
    [confirm]
    border = { fg = "#ced4df" }
    title = { fg = "#859ba2" }
    content = {}
    list = {}
    btn_yes = { bg = "#424242" }
    btn_no = {}
    btn_labels = ["  [Y]es  ", "  (N)o  "]

    # Spot
    [spot]
    border = { fg = "#859ba2" }
    title = { fg = "#859ba2" }

    # Notify
    [notify]
    title_info = { fg = "#ced4df" }
    title_warn = { fg = "#859ba2" }
    title_error = { fg = "#eee8d5" }

    icon_error = ""
    icon_warn = ""
    icon_info = ""

    # Help
    [help]
    on = { fg = "#7b9198" }
    run = { fg = "#DAD4C3" }
    hovered = { bg = "#424242" }
    footer = { fg = "#c7cdd8", bg = "#101010" }

    [filetype]

    rules = [
      # Images
      { mime = "image/*", fg = "#859ba2" },

      # Media
      { mime = "{audio,video}/*", fg = "#DAD4C3" },

      # Archives
      { mime = "application/*zip", fg = "#838383" },
      { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#838383" },

      # Documents
      { mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#DFDFDA" },

      # Empty files
      # { mime = "inode/x-empty", fg = "#eee8d5" },

      # Special files
      { name = "*", is = "orphan", bg = "#eee8d5" },
      { name = "*", is = "exec", fg = "#7b9198" },

      # Fallback
      { name = "*/", fg = "#ced4df" },
    ]
  '';
}
