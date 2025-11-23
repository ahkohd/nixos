{ ... }:

let
  aliases = {
    a = "open -n -a Alacritty";
    c = "clear";
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

    export GOPATH=~/go
    export PATH=$GOPATH/bin:$PATH

    export PATH=~/.npm-packages/bin:$PATH

    export NODE_PATH=~/.npm-packages/lib/node_modules

    j-() {
        local count=''${1:-1}
        local suffix=$(printf '%*s' "$count" | tr ' ' '-')
        jj edit "@''${suffix}" --ignore-immutable
    }

    j+() {
        local count=''${1:-1}
        local suffix=$(printf '%*s' "$count" | tr ' ' '+')
        jj edit "@''${suffix}" --ignore-immutable
    }

    gh_env() {
      export GITHUB_PERSONAL_ACCESS_TOKEN=$(op read "op://Personal/SHELL GH_PATH/credential" --no-newline) 
      export GH_PAT=$(op read "op://Personal/SHELL GH_PATH/credential" --no-newline) 
    }

    ai_env() {
      export OPENAI_API_KEY=$(op read "op://Personal/OpenAiApi/credential" --no-newline) 
    }

    # preview markdown that looks like GitHub
    md() {
        if ! command -v gh &>/dev/null; then
            echo "Error: gh (GitHub CLI) is not installed"
            return 1
        fi

        if ! gh extension list | grep -q "yusukebe/gh-markdown-preview"; then
            echo "Error: gh-markdown-preview extension is not installed. Install it with: gh extension install yusukebe/gh-markdown-preview"
            return 1
        fi

        if ! command -v fd &>/dev/null; then
            echo "Error: fd is not installed"
            return 1
        fi

        if ! command -v fzf &>/dev/null; then
            echo "Error: fzf is not installed"
            return 1
        fi

        local file
        file="$(fd -e md -e markdown | fzf)" || return 1
        [ -z "$file" ] && return 0
        gh markdown-preview "$file" &
    }

    nixu() {
      local theme=""
      while [[ $# -gt 0 ]]; do
        case "$1" in
          --theme=*) theme="''${1#*=}"; shift ;;
          --theme) theme="$2"; shift 2 ;;
          *) echo "Unknown option: $1"; return 1 ;;
        esac
      done
      if [[ -z "$theme" ]]; then
        if [[ $(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode') == "true" ]]; then
          theme="dark"
        else
          theme="light"
        fi
      fi
      echo "Applying theme: $theme"
      echo "$theme" > ~/.dotfiles/.theme
      sudo darwin-rebuild switch --flake ~/.dotfiles
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
    completionInit = "autoload -U compinit && compinit -i";
    inherit initContent;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "never";
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
