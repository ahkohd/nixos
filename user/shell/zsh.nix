{ config, pkgs, ... }:

let
  aliases = {
    c = "clear";
    wm = "Hyprland";
    hmu = "home-manager switch --flake ~/.dotfiles";
    nixu = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    gpg-check = "gpg --decrypt ~/test.gpg";
    dev = "~/developer/personal";
    grep = "grep --color=auto";
    gst = "git status";
    nv = "neovide";
    pbcopy = "wl-copy";
    pbpaste = "wl-past";
    tree = "eza --tree --level=4";
    cat = "bat --theme='mellow'";
    f =
      "fzf --preview 'bat --theme=mellow --color=always --style=header,grid --line-range :500 {}'";
    x = "exit";
    cht = "~/.config/bin/.local/scripts/tmux-cht.sh";
    lg = "lazygit";
    cd = "z";
    zz = "z -";
  };

  zshExtensionsDir = "~/.nix-profile/share/oh-my-zsh/plugins/vi-mode";

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
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting"
        "nix-community/nix-zsh-completions"
        "wfxr/forgit"
        "jeffreytse/zsh-vi-mode"
      ];
    };
    oh-my-zsh = { enable = true; };
    initExtra = ''
             # work around to make vi-mode work with fzf
             # see: https://github.com/jeffreytse/zsh-vi-mode/issues/265

             source ${zshExtensionsDir}/vi-mode.plugin.zsh
      	if [ -n "''${commands[fzf-share]}" ]; then
      	  source "$(fzf-share)/key-bindings.zsh"
      	  source "$(fzf-share)/completion.zsh"
      	fi

             if ssh-add -l | grep -q "id_github";
             then
               # do nothing
             else
              ssh-add ~/.ssh/id_github;
             fi
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
