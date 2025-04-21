{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Victor Aremu";
    userEmail = "me@victorare.mu";
    extraConfig = {
      github = { user = "ahkohd"; };
      user = { signingkey = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD"; };
      commit = { gpgsign = true; };
      core = {
        editor = "vim";
        pager = "riff";
      };
      merge = { conflictstyle = "diff3"; };
      diff = { colorMoved = "default"; };
      pager = {
        diff = "riff";
        show = "riff";
        log = "riff";
      };
      interactive = { diffFilter = "riff --color=on"; };
    };
  };
}
