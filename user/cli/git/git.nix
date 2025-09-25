{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Victor Aremu";
        email = "me@victorare.mu";
      };
      github = { user = "ahkohd"; };
      user = { signingkey = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD"; };
      commit = { gpgsign = true; };
      core = {
        editor = "vim";
        pager = "moor -colors 16";
      };
      merge = { conflictstyle = "diff3"; };
      diff = {
        external = "difft --color=always";
        colorMoved = "default";
      };
      interactive = { diffFilter = "difft --color=always"; };
    };
  };
}
