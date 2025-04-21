{ ... }:

let
  aliases = {
    c = "clear";
    nixu = "darwin-rebuild switch --flake ~/.dotfiles";
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
    p = "pnpm";
    y = "yy";
    speed = "speedtest-cli";
    jn = "jj new";
    jst = "jj st --no-pager";
    jpw = "jj git push --change=@";
    jsq = "jj squash";
    jsqi = "jj squash --ignore-immutable";
    jed = "jj edit";
    jedi = "jj edit --ignore-immutable";
    jds = "jj desc";
    jdsi = "jj desc --ignore-immutable";
    jgp = ''
      j git push --bookmark=$(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jfo = "jj git fetch --remote=origin";
    jbk = ''
      j bookmark set $(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jbki = "jbk --ignore-immutable";
    jab = "jj abandon";
    jls = "jj log -n 12";
    jll = "jj log -n 12 -r '..@'";
    jla = "jj log -r 'all()'";
    jllb = "jj log -r 'bookmarks()'";
    jlrb = "jj log -r 'remote_bookmarks()'";
    jlh = "jj log -r 'visible_heads()'";
    j = "jj";
  };

  initExtra = ''
    export EDITOR=nvim
    export PAGER=moar
    export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
    export BACON_PREFS=~/.config/bacon/prefs.toml
  '';

in {

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    antidote = {
      enable = true;
      plugins = [ "Aloxaf/fzf-tab" "ahkohd/tmux-sessionizer" ];
    };
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
