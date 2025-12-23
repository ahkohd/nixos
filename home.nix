{ pkgs, ... }:

{
  imports = [
    ./user/gpg.nix # gpg-agent service (config via stow)
    ./user/shell.nix # program integrations: zsh, starship, fzf, atuin, eza, zoxide, direnv, etc.
    ./user/fonts.nix # font packages (can't do with stow)
    ./user/cli/nvim.nix # neovim nightly overlay
  ];

  # All dotfile configs are managed by stow (~/dotfiles).
  # HM only handles: package installation, program enablement, services.

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
