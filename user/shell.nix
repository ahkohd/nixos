{ ... }:

let
  aliases = {
    c = "clear";
    w = "dbus-run-session -- gnome-shell --display-server --wayland";
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
    jn = "jj new";
    js = "jj st --no-pager";
    jpw = "jj git push --change=@";
    jsq = "jj squash";
    jsqi = "jj squash --ignore-immutable";
    je = "jj edit";
    jei = "jj edit --ignore-immutable";
    jd = "jj desc";
    jdi = "jj desc --ignore-immutable";
    jgp = ''
      j git push --bookmark=$(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jf = "jj git fetch --remote=origin";
    jb = ''
      j bookmark set $(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jbi = "jbk --ignore-immutable";
    jab = "jj abandon";
    jl = "jj log -n 12";
    jll = "jj log -n 12 -r '..@'";
    jla = "jj log -r 'all()'";
    jlb = "jj log -r 'bookmarks()'";
    jlrb = "jj log -r 'remote_bookmarks()'";
    jlh = "jj log -r 'visible_heads()'";
    j = "jj";
  };

  initContent = ''
    export EDITOR=nvim
    export PAGER=moar
    export BACON_PREFS=~/.config/bacon/prefs.toml
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';
in {

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    antidote = {
      enable = true;
      plugins = [ "Aloxaf/fzf-tab" ];
    };
    inherit initContent;
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
