{ ... }:

{
  programs.git = {
    enable = true;
    signing.format = "openpgp";
    settings = {
      user = {
        name = "Victor Aremu";
        email = "me@victorare.mu";
        signingkey = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD";
      };
      github = { user = "ahkohd"; };
      commit = { gpgsign = true; };
      core = {
        editor = "vim";
        pager = "difft";
      };
      pager = {
        diff = "difft";
        show = "difft";
        log = "difft";
      };
      interactive = { diffFilter = "difft --color=on"; };
      merge = { conflictstyle = "diff3"; };
      diff = { colorMoved = "default"; };
    };
  };
}
