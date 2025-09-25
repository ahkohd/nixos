{ ... }:

let
  aliases = {
    c = "clear";
    nixu = "sudo darwin-rebuild switch --flake ~/.dotfiles";
    gpg-check = "gpg --decrypt ~/test.gpg";
    dev = "~/developer/personal";
    grep = "grep --color=auto";
    gst = "git status";
    glg = "git log -n 10 --graph --decorate --oneline";
    cat = "bat";
    nv = "nvim";
    nvd = "neovide";
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
    js = "jj st --no-pager";
    jsq = "jj squash";
    jsqi = "jj squash --ignore-immutable";
    je = "jj edit";
    jei = "jj edit --ignore-immutable";
    jd = "jj desc";
    jdi = "jj desc --ignore-immutable";
    jdf = "jj diff";
    jp = ''
      jj git push --allow-new --bookmark=$(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jf = "jj git fetch --remote=origin";
    jb = ''
      j bookmark set $(j bookmark list --template 'name ++ "\n"' --no-pager | sort -u | fzf)'';
    jbi = "jb --ignore-immutable";
    jbk = "jj bookmark";
    jbs = "jj bookmark set";
    ja = "jj abandon";
    jl = "jj log -r 'all()'";
    jlb = "jj log -r 'bookmarks()'";
    jlr = "jj log -r 'remote_bookmarks()'";
    jlh = "jj log -r 'visible_heads()'";
    j = "jj";
  };

  initContent = ''
    export EDITOR=nvim
    export PAGER=moar
    export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
    export BACON_PREFS=~/.config/bacon/prefs.toml

    # Setup NPM to install some global packages
    export PATH=~/.npm-packages/bin:$PATH
    export NODE_PATH=~/.npm-packages/lib/node_modules

    gh_env() {
      export GITHUB_PERSONAL_ACCESS_TOKEN=$(op read "op://Personal/SHELL GH_PATH/credential" --no-newline) 
      export GH_PAT=$(op read "op://Personal/SHELL GH_PATH/credential" --no-newline) 
    }

    ai_env() {
      export OPENAI_API_KEY=$(op read "op://Personal/OpenAiApi/credential" --no-newline) 
    }
  '';

in {

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    antidote = {
      enable = true;
      plugins = [ "Aloxaf/fzf-tab" "ahkohd/tmux-sessionizer" ];
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

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };
}
