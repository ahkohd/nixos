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
      core = {
        editor = "vim";
        pager = "delta";
      };
      merge = { conflictstyle = "diff3"; };
      diff = { colorMoved = "default"; };
    };
    includes = [{ path = "~/.config/git/delta.inc"; }];
  };

  home.file.".config/git/delta.inc".text = ''
    [delta]
      navigate = true

      file-added-label = [+]
      file-copied-label = [==]
      file-modified-label = [*]
      file-removed-label = [-]
      file-renamed-label = [->]
  '';
}

