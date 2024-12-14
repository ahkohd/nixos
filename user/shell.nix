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

  initExtra = ''
    export EDITOR=nvim
    export SSH_AUTH_SOCK=/home/var/.1password/agent.sock
  '';
in {

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    antidote = {
      enable = true;
      plugins =
        [ "Aloxaf/fzf-tab" "zdharma-continuum/fast-syntax-highlighting" ];
    };
    oh-my-zsh = { enable = true; };
    inherit initExtra;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
