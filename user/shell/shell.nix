{ pkgs, ... }:

let
  aliases = {
    c = "clear";
    w = "Hyprland";
    hmu = "home-manager switch --flake ~/.dotfiles";
    nixu = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    gpg-check = "gpg --decrypt ~/test.gpg";
    dev = "~/developer/personal";
    grep = "grep --color=auto";
    gst = "git status";
    pbcopy = "wl-copy";
    pbpaste = "wl-paste";
    ls = "lsd --icon always --tree --depth=1";
    tree = "lsd --icon always --tree --depth=4";
    cat = "bat";
    f =
      "fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}'";
    nv = ''nvim "$(f)"'';
    nvc = "nvim-config";
    x = "exit";
    lg = "lazygit";
    cd = "z";
    zz = "z -";
    pm = "pulsemixer";
    p = "pnpm";
    y = "yy";
    speed = "speedtest-cli";
  };

in {

  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    antidote = {
      enable = true;
      plugins = [
        "marlonrichert/zsh-autocomplete"
        "zdharma-continuum/fast-syntax-highlighting"
        "nix-community/nix-zsh-completions"
        "wfxr/forgit"
      ];
    };
    oh-my-zsh = { enable = true; };
    initExtra = ''
      if ssh-add -l | grep -q "id_github";
      then
        # do nothing
      else
       ssh-add ~/.ssh/id_github;
      fi

      export EDITOR="nvim"
    '';
  };

  programs.fish = {
    enable = true;
    shellAliases = aliases;
    plugins = [
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
      {
        name = "fifc";
        src = pkgs.fishPlugins.fifc.src;
      }
    ];
    shellInit = builtins.readFile ./fish/init.fish;
  };

  home.file.".config/fish/extra_vars.fish".text =
    builtins.readFile ./fish/extra_vars.fish;

  home.file.".config/fish/themes/fzf.fish".text =
    builtins.readFile ./fish/themes/fzf.fish;

  home.file.".config/fish/themes/tokyonight_strom.fish".text =
    builtins.readFile ./fish/themes/tokyonight_strom.fish;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.lsd = {
    enable = true;
    colors = true;
    # enableAliases = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
