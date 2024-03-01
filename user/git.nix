{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Victor Aremu";
    userEmail = "me@victorare.mu";
    extraConfig = {
      github = { user = "ahkohd"; };
      url = {
        "https://" = { insteadOf = "git://"; };
        "git@github.com:" = { insteadOf = "https://github.com/"; };
      };
      user = { signingkey = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD"; };
      commit = { gpgsign = true; };
      core = { editor = "vim"; };
      merge = { conflictstyle = "diff3"; };
      diff = { colorMoved = "default"; };
    };
    delta = {
      enable = true;
      options = {
        # Theme: mellow.nvim
        # Author: https://github.com/kvrohit
        # To configure terminal colors see https://github.com/kvrohit/mellow.nvim#terminals
        dark = true;
        syntax-theme = "base16";
        line-numbers = true;
        side-by-side = true;
        file-style = "brightwhite";
        file-decoration-style = "none";
        file-added-label = "[+]";
        file-copied-label = "[==]";
        file-modified-label = "[*]";
        file-removed-label = "[-]";
        file-renamed-label = "[->]";
        hunk-header-decoration-style = "'#3e3e43' box ul";
        plus-style = "brightgreen black";
        plus-emph-style = "black green";
        minus-style = "brightred black";
        minus-emph-style = "black red";
        line-numbers-minus-style = "brightred";
        line-numbers-plus-style = "brightgreen";
        line-numbers-left-style = "#3e3e43";
        line-numbers-right-style = "#3e3e43";
        line-numbers-zero-style = "#57575f";
        zero-style = "syntax";
        whitespace-error-style = "black bold";
        blame-code-style = "syntax";
        blame-palette = "'#161617' '#1b1b1d' '#2a2a2d' '#3e3e43'";
        merge-conflict-begin-symbol = "~";
        merge-conflict-end-symbol = "~";
        merge-conflict-ours-diff-header-style = "yellow bold";
        merge-conflict-ours-diff-header-decoration-style = "'#3e3e43' box";
        merge-conflict-theirs-diff-header-style = "yellow bold";
        merge-conflict-theirs-diff-header-decoration-style = "'#3e3e43' box";
      };
    };
  };
}
