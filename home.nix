{ pkgs, ... }:

{
  imports = [
    ./user/ssh.nix
    ./user/shell.nix
    ./user/gpg.nix
    ./user/cli/git/git.nix
    ./user/cli/git/jj.nix
    ./user/cli/bat.nix
    ./user/cli/btop.nix
    ./user/cli/direnv.nix
    ./user/cli/nvim.nix
    ./user/cli/yazi.nix
    ./user/cli/gh.nix
  ];

  home.username = "var";
  home.homeDirectory = "/home/var";

  home.stateVersion = "23.11";

  home.packages = import ./user/development.nix { inherit pkgs; };

  home.file = { };

  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
