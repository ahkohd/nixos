{ pkgs, ... }:

{
  imports = [
    ./user/gpg.nix
    ./user/ssh.nix
    ./user/shell.nix
    ./user/fonts.nix
    ./user/apps/terminals/ghostty/ghostty.nix
    ./user/cli/tmux.nix
    ./user/cli/btop.nix
    ./user/cli/gh.nix
    ./user/cli/direnv.nix
    ./user/cli/yazi.nix
    ./user/cli/git/git.nix
    ./user/cli/git/jj.nix
    ./user/cli/git/lazy.nix
    ./user/cli/bat.nix
    ./user/cli/nvim.nix
  ];

  home.username = "var";
  home.homeDirectory = "/Users/var";

  home.stateVersion = "23.11";

  home.packages = import ./user/packages.nix { inherit pkgs; }
    ++ import ./user/development.nix { inherit pkgs; };

  home.file = { };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;
}
