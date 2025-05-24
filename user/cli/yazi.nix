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
    # highlight = "path/to/tmTheme"

    cwd = { fg = "#a9b1d6", italic = true }

    # Hovered
    hovered         = { bg = "#292e42" }
    preview_hovered = { bg = "#292e42" }

    # Find
    find_keyword  = { fg = "#1f2335", bg = "#ff9e64", bold = true }
    find_position = { fg = "#0db9d7", bg = "#22374b", bold = true }

    # Marker
    marker_copied   = { fg = "#73daca", bg = "#73daca" }
    marker_cut      = { fg = "#f7768e", bg = "#f7768e" }
    marker_marked   = { fg = "#bb9af7", bg = "#bb9af7" }
    marker_selected = { fg = "#7aa2f7", bg = "#7aa2f7" }

    # Tab
    tab_active   = { fg = "#c0caf5", bg = "#292e42" }
    tab_inactive = { fg = "#3b4261", bg = "#24283b" }
    tab_width    = 1

    # Count
    count_copied   = { fg = "#c0caf5", bg = "#41a6b5" }
    count_cut      = { fg = "#c0caf5", bg = "#db4b4b" }
    count_selected = { fg = "#c0caf5", bg = "#3d59a1" }
    # Border
    border_symbol = "│"
    border_style  = { fg = "#29a4bd" }

    [status]
    separator_open  = ""
    separator_close = ""
    separator_style = { fg = "#3b4261", bg = "#3b4261" }

    # Mode
    mode_normal = { fg = "#1f2335", bg = "#7aa2f7", bold = true }
    mode_select = { fg = "#1f2335", bg = "#bb9af7", bold = true }
    mode_unset  = { fg = "#1f2335", bg = "#9d7cd8", bold = true }

    # Progress
    progress_label  = { fg = "#a9b1d6", bold = true }
    progress_normal = { fg = "#24283b" }
    progress_error  = { fg = "#f7768e" }

    # Permissions
    permissions_t = { fg = "#7aa2f7" }
    permissions_r = { fg = "#e0af68" }
    permissions_w = { fg = "#f7768e" }
    permissions_x = { fg = "#9ece6a" }
    permissions_s = { fg = "#414868" }

    [select]
    border   = { fg = "#29a4bd" }
    active   = { fg = "#c0caf5",  bg = "#2e3c64" }
    inactive = { fg = "#c0caf5" }

    # Input
    [input]
    border   = { fg = "#0db9d7" }
    title    = {}
    value    = { fg = "#9d7cd8" }
    selected = { bg = "#2e3c64" }

    # Completion
    [completion]
    border   = { fg = "#0db9d7" }
    active   = { fg = "#c0caf5", bg = "#2e3c64" }
    inactive = { fg = "#c0caf5" }

    # Tasks
    [tasks]
    border  = { fg = "#29a4bd" }
    title   = {}
    hovered = { fg = "#c0caf5", bg="#2e3c64" }

    # Which
    [which]
    cols = 3
    mask            = { bg = "#1f2335" }
    cand            = { fg = "#7dcfff" }
    rest            = { fg = "#7aa2f7" }
    desc            = { fg = "#bb9af7" }
    separator       = "  "
    separator_style = { fg = "#565f89" }

    # Notify
    [notify]
    title_info  = { fg = "#0db9d7" }
    title_warn  = { fg = "#e0af68" }
    title_error = { fg = "#f7768e" }

    # Help
    [help]
    on      = { fg = "#9ece6a" }
    run     = { fg = "#bb9af7" }
    hovered = { bg = "#2e3c64" }
    footer  = { fg = "#c0caf5", bg = "#24283b" }

    [filetype]

    rules = [
    	# Images
    	{ mime = "image/*", fg = "#e0af68" },

    	# Media
    	{ mime = "{audio,video}/*", fg = "#bb9af7" },

    	# Archives
    	{ mime = "application/*zip", fg = "#f7768e" },
    	{ mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#f7768e" },

    	# Documents
    	{ mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#7dcfff" },

    	# Empty files
    	# { mime = "inode/x-empty", fg = "#f7768e" },

    	# Special files
    	{ name = "*", is = "orphan", bg = "#f7768e" },
    	{ name = "*", is = "exec"  , fg = "#9ece6a" },

    	# Fallback
    	{ name = "*/", fg = "#7aa2f7" }
    ]
  '';
}
