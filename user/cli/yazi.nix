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
    sep_left = { open = "", close = "" }
    sep_right = { open = "", close = "" }

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

    [icon]
    globs = []
    dirs  = []
    files = []
    exts  = []
    conds = []

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
