{ config, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = { theme = "tokyonight_storm"; };
    themes = {
      tokyonight_storm = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "054790b8676d0c561b22320d4b5ab3ef175f7445";
          sha256 = "sha256-mriZ9QBe1QIDsBkGd+tmg4bNFtD0evuSom2pWyQ1yEM=";
        } + "/extras/sublime/tokyonight_storm.tmTheme";
      };
    };
  };
}
