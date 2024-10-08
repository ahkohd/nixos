{ config, pkgs, ... }:

{
  imports = [
    ./system/shell/zsh.nix
    ./system/development.nix
    ./system/sops.nix
    ./system/nginx.nix
  ];

  # Select internationalization properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NG";
    LC_IDENTIFICATION = "en_NG";
    LC_MEASUREMENT = "en_NG";
    LC_MONETARY = "en_NG";
    LC_NAME = "en_NG";
    LC_NUMERIC = "en_NG";
    LC_PAPER = "en_NG";
    LC_TELEPHONE = "en_NG";
    LC_TIME = "en_NG";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  # Auto start SSH agent
  programs.ssh.startAgent = true;

  # Disable Nano editor (enabled by default)
  programs.nano.enable = false;
}
