{ ... }:

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
    glg = "git log -n 10 --graph --decorate --oneline";
    pbcopy = "wl-copy";
    pbpaste = "wl-paste";
    cat = "bat";
    nv = "nvim";
    nvc = "nvim-config";
    x = "exit";
    lg = "lazygit";
    cd = "z";
    ls = "eza --tree --level=1";
    l = "eza -l --tree --level=1";
    zz = "z -";
    pm = "pulsemixer";
    p = "pnpm";
    y = "yy";
    speed = "speedtest-cli";
    jst = "jj st --no-pager";
    jbl = "jj log -r 'heads(all())'";
    jpw = "jj git push --change=@";
    jsq = "jj squash";
    jed = "jj edit";
    jds = "jj desc";
    jfo = "jj git fetch --remote=origin";
    jbk = "jj bookmark";
    jab = "jj abandon";
    jla = "jj log -r 'all()'";
    jt = "jj_tui";
    j = "jj";
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
        "Aloxaf/fzf-tab"
        "zsh-users/zsh-autosuggestions"
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

      autoload -U compinit
      compinit
      source <(jj util completion zsh)
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
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
