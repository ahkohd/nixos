{ pkgs, ... }:

{
  imports = [
    ./system/darwin.nix
    ./system/homebrew.nix
    ./system/packages.nix
    # ./system/janky.nix
    # ./system/skhd.nix
  ];

  environment.systemPackages = with pkgs; [ vim git home-manager ];

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;

  system.primaryUser = "var";

  users.users.var = {
    name = "var";
    home = "/Users/var";
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  ids.gids.nixbld = 350;
}
