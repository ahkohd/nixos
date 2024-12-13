{ pkgs, ... }:

{
  imports = [ ./system/darwin.nix ./system/homebrew.nix ./system/packages.nix ];

  environment.systemPackages = with pkgs; [ vim git home-manager ];

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;

  users.users.var = {
    name = "var";
    home = "/Users/var";
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
}
