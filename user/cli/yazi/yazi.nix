{ pkgs, colorscheme, ... }:

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

  home.file.".config/yazi/theme.toml".source = if colorscheme == "light" then
    ./themes/cyberdream-light.toml
  else
    ./themes/cyberdream.toml;

  home.file.".config/yazi/tmtheme.xml".source = if colorscheme == "light" then
    ../bat/themes/cyberdream-light.tmTheme
  else
    ../bat/themes/cyberdream.tmTheme;
}
