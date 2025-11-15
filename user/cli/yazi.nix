{ pkgs, ... }:

{

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      show_symlink = true;
      mgr = { show_hidden = true; };
      plugin = {
        prepend_previewers = [{
          name = "*/";
          run = "eza-preview";
        }];
      };
    };
  };

  home.file.".config/yazi/plugins/eza-preview.yazi".source =
    pkgs.fetchFromGitHub {
      owner = "ahkohd";
      repo = "eza-preview.yazi";
      rev = "e4b7a380b7344940e09f2d3c5ce3560c0b651931";
      sha256 = "sha256-wDT4VC9/W/RNk1k6qO4B8J858lkcg03zgS8+hdjimvE=";
    };

  home.file.".config/yazi/plugins/starship.yazi".source = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "a63550b2f91f0553cc545fd8081a03810bc41bc0";
    sha256 = "sha256-PYeR6fiWDbUMpJbTFSkM57FzmCbsB4W4IXXe25wLncg=";
  };

  home.file.".config/yazi/plugins/no-status.yazi".source =
    pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "22af0033be18eead7b04c2768767d38ccfbaa05b";
      sha256 = "sha256-ZCLJ6BjMAj64/zM606qxnmzl2la4dvO/F5QFicBEYfU=";
    } + "/no-status.yazi";

  home.file.".config/yazi/plugins/yamb.yazi".source = pkgs.fetchFromGitHub {
    owner = "h-hg";
    repo = "yamb.yazi";
    rev = "22af0033be18eead7b04c2768767d38ccfbaa05b";
    sha256 = "sha256-NMxZ8/7HQgs+BsZeH4nEglWsRH2ibAzq7hRSyrtFDTA=";
  };

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
      # yamb keymaps
      { on = [
        "u",
        "a",
      ], run = "plugin yamb save", desc = "Add bookmark" },
      { on = [
        "u",
        "g",
      ], run = "plugin yamb jump_by_key", desc = "Jump bookmark by key" },
      { on = [
        "u",
        "G",
      ], run = "plugin yamb jump_by_fzf", desc = "Jump bookmark by fzf" },
      { on = [
        "u",
        "d",
      ], run = "plugin yamb delete_by_key", desc = "Delete bookmark by key" },
      { on = [
        "u",
        "D",
      ], run = "plugin yamb delete_by_fzf", desc = "Delete bookmark by fzf" },
      { on = [
        "u",
        "A",
      ], run = "plugin yamb delete_all", desc = "Delete all bookmarks" },
      { on = [
        "u",
        "r",
      ], run = "plugin yamb rename_by_key", desc = "Rename bookmark by key" },
      { on = [
        "u",
        "R",
      ], run = "plugin yamb rename_by_fzf", desc = "Rename bookmark by fzf" },
    ]
  '';

  home.file.".config/yazi/init.lua".text = ''
    require("starship"):setup()

    require("eza-preview"):setup{
      level = 2,
      icons = false,
      follow_symlinks = true,
      dereference = false,
      all = true
    }

    require("no-status"):setup()

    local bookmarks = {}
    local path_sep = package.config:sub(1, 1)
    local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")

    if ya.target_family() == "windows" then
      table.insert(bookmarks, {
        tag = "Scoop Local",

        path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
        key = "p"
      })
      table.insert(bookmarks, {
        tag = "Scoop Global",
        path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
        key = "P"
      })
    end
    table.insert(bookmarks, {
      tag = "Desktop",
      path = home_path .. path_sep .. "Desktop" .. path_sep,
      key = "d"
    })

    require("yamb"):setup {
      bookmarks = bookmarks,
      jump_notify = true,
      cli = "fzf",
      keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
      path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
            (os.getenv("HOME") .. "/.config/yazi/bookmark"),
    }
  '';

  home.file.".config/yazi/theme.toml".text = ''
    [mgr]
    # NOTE: can combined with tmTheme (sublime colorshceme file) for preview code highlight
    # syntect_theme = "path/to/tmTheme"

    cwd = { fg = "#a89984", italic = true }          # gray2

    # Hovered
    hovered = { bg = "#3c3836" }                     # bg3
    preview_hovered = { bg = "#3c3836" }             # bg3

    # Find
    find_keyword = { fg = "#1d2021", bg = "#d4be98", bold = true }  # bg0 on fg0
    find_position = { fg = "#ddc7a1", bg = "#3c3836", bold = true } # fg1 on bg3

    # Marker
    marker_copied   = { fg = "#89b482", bg = "#89b482" }            # aqua
    marker_cut      = { fg = "#ea6962", bg = "#ea6962" }            # red
    marker_marked   = { fg = "#d8a657", bg = "#d8a657" }            # yellow
    marker_selected = { fg = "#7daea3", bg = "#7daea3" }            # blue

    # Tab
    tab_active   = { fg = "#ddc7a1", bg = "#3c3836" }               # fg1 on bg3
    tab_inactive = { fg = "#7c6f64", bg = "#1d2021" }               # gray0 on bg0
    tab_width = 1

    # Count
    count_copied   = { fg = "#d4be98", bg = "#89b482" }             # fg0 on aqua
    count_cut      = { fg = "#d4be98", bg = "#7c6f64" }             # fg0 on gray0
    count_selected = { fg = "#1d2021", bg = "#a9b665" }             # bg0 on green

    # Border
    border_symbol = "│"
    border_style = { fg = "#928374" }                               # gray1

    [mode]
    normal_main = { fg = "#1d2021", bg = "#d8a657", bold = true }   # bg0 on yellow
    normal_alt  = { fg = "#d4be98", bg = "#3c3836" }                 # fg0 on bg3

    select_main = { fg = "#1d2021", bg = "#a9b665", bold = true }   # bg0 on green
    select_alt  = { fg = "#a9b665", bg = "#3c3836" }                 # green on bg3

    unset_main  = { fg = "#1d2021", bg = "#ea6962", bold = true }   # bg0 on red
    unset_alt   = { fg = "#ea6962", bg = "#3c3836" }                 # red on bg3

    [status]
    sep_left = { open = "", close = "" }
    sep_right = { open = "", close = "" }

    # separator_style = { fg = "#3c3836", bg = "#3c3836" }

    # Progress
    progress_label = { fg = "#d4be98", bold = true }                # fg0
    progress_normal = { fg = "#3c3836" }                            # bg3
    progress_error  = { fg = "#ea6962" }                            # red

    # Permissions
    perm_type = { fg = "#d4be98" }                                  # fg0
    perm_read = { fg = "#89b482" }                                  # aqua
    perm_write = { fg = "#d8a657" }                                 # yellow
    perm_exec = { fg = "#a9b665" }                                  # green
    perm_sep = { fg = "#928374" }                                   # gray1

    [pick]
    border = { fg = "#928374" }                                     # gray1
    active = { fg = "#d4be98", bg = "#3c3836" }                     # fg0 on bg3
    inactive = { fg = "#d4be98" }                                   # fg0

    # Input
    [input]
    border   = { fg = "#d4be98" }                                   # fg0
    title    = { fg = "#d4be98" }                                   # fg0
    value    = { fg = "#ddc7a1" }                                   # fg1
    selected = { bg = "#3c3836" }                                   # bg3

    # Completion
    [completion]
    border  = { fg = "#d4be98" }                                    # fg0
    active  = { fg = "#d4be98", bg = "#3c3836" }                    # fg0 on bg3
    inactive = { fg = "#d4be98" }                                   # fg0

    [icon]
    globs = []
    dirs  = []
    files = []
    exts  = []
    conds = []

    # Tasks
    [tasks]
    border  = { fg = "#928374" }                                    # gray1
    title   = { fg = "#928374" }                                    # gray1
    hovered = { fg = "#d4be98", bg = "#3c3836" }                    # fg0 on bg3

    # Which
    [which]
    cols = 3
    mask      = { bg = "#141617" }                                  # bg_dim
    cand      = { fg = "#ddc7a1" }                                  # fg1
    rest      = { fg = "#d4be98" }                                  # fg0
    desc      = { fg = "#a89984" }                                  # gray2
    separator = " ➜ "
    separator_style = { fg = "#928374" }                            # gray1

    # Confirm
    [confirm]
    border  = { fg = "#d4be98" }                                    # fg0
    title   = { fg = "#a89984" }                                    # gray2
    content = {}
    list    = {}
    btn_yes = { bg = "#3c3836" }                                    # bg3
    btn_no  = {}
    btn_labels = ["  [Y]es  ", "  (N)o  "]

    # Spot
    [spot]
    border = { fg = "#928374" }                                     # gray1
    title  = { fg = "#928374" }                                     # gray1

    # Notify
    [notify]
    title_info  = { fg = "#d4be98" }                                # fg0
    title_warn  = { fg = "#d8a657" }                                # yellow
    title_error = { fg = "#ea6962" }                                # red

    icon_error = ""
    icon_warn  = ""
    icon_info  = ""

    # Help
    [help]
    on      = { fg = "#89b482" }                                    # aqua
    run     = { fg = "#ddc7a1" }                                    # fg1
    hovered = { bg = "#3c3836" }                                    # bg3
    footer  = { fg = "#d4be98", bg = "#1d2021" }                    # fg0 on bg0

    [filetype]

    rules = [
      # Images
      { mime = "image/*", fg = "#89b482" },                         # aqua

      # Media
      { mime = "{audio,video}/*", fg = "#ddc7a1" },                 # fg1

      # Archives
      { mime = "application/*zip", fg = "#928374" },                # gray1
      { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#928374" },

      # Documents
      { mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#a89984" }, # gray2

      # Empty files
      # { mime = "inode/x-empty", fg = "#eee8d5" },

      # Special files
      { name = "*", is = "orphan", bg = "#ea6962" },                # red bg
      { name = "*", is = "exec",  fg = "#a9b665" },                 # green

      # Fallback
      { name = "*/", fg = "#d4be98" },                              # fg0
    ]
  '';
}
