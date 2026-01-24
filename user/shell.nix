{ ... }:

let
  aliases = {
    c = "clear";
    hmu = "home-manager switch --flake ~/.dotfiles";
    nixu = "sudo nixos-rebuild switch --flake ~/.dotfiles --impure";
    gpg-check = "gpg --decrypt ~/test.gpg";
    grep = "grep --color=auto";
    gst = "git status";
    glg = "git log -n 10 --graph --decorate --oneline";
    cat = "bat";
    nv = "nvim";
    x = "exit";
    cd = "z";
    ls = "eza --tree --level=1";
    l = "eza -l --tree --level=1";
    zz = "z -";
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
    jp = "jj git push";
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
    oc = "podman exec openclaw npx openclaw";
  };

  initContent = ''
    export EDITOR=nvim
    export PAGER=moor
    export GPG_TTY=$(tty)
    export PATH=$HOME/.npm-packages/bin:$PATH
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
