# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include the apple silicon support module.
    ./apple-silicon-support
    ./system/wm/hyprland/hyprland.nix
    ./system/shell/zsh.nix
    ./system/ssh.nix
    ./system/apps/op.nix
    ./system/apps/obsidian.nix
    # ./system/apps/ghostty.nix
    # ./system/apps/zen-browser.nix
    ./system/development.nix
    ./system/media.nix
    ./system/audio.nix
    ./system/apps/media/hyprshot.nix
    ./system/sops.nix
    ./system/appimage.nix
    ./system/services/bluetooth.nix
  ];

  hardware = {
    asahi = {
      # Specify path to peripheral firmware files.
      peripheralFirmwareDirectory = ./firmware;
      # Use the experimental GPU drivers for graphcis acceleration
      useExperimentalGPUDriver = true;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "nixos"; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Lagos";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.var = {
    isNormalUser = true;
    description = "Victor Aremu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  # White list insecure packages

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  environment.systemPackages = with pkgs; [
    vim
    git
    home-manager
    # Install graphics drivers
    mesa
    mesa.drivers
  ];

  # Disable Nano editor (enabled by default)
  programs.nano.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  # };

  # Auto start SSH agent
  programs.ssh.startAgent = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];

  networking.firewall.allowedUDPPorts = [ ];

  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Setup NixOS Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
