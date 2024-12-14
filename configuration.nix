{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/desktop.nix
    ./system/ssh.nix
    ./system/nginx.nix
    ./system/op.nix
    ./system/services/audio/roon.nix
    ./system/packages.nix
    ./system/audio.nix
    ./system/appimage.nix
    ./system/services/bluetooth.nix
    ./system/services/flatpak.nix
  ];

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Lagos";

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

  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  console.keyMap = "us";

  programs.zsh.enable = true;

  users.users.var = {
    isNormalUser = true;
    description = "Victor Aremu";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  users.users.root = {
    isNormalUser = false;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ vim git home-manager ];

  programs.nano.enable = false;

  programs.ssh.startAgent = true;

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 22 80 443 55000 ];

  networking.firewall.allowedUDPPorts = [ ];

  networking.firewall.enable = true;

  system.stateVersion = "23.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NAS 01
  fileSystems."/mnt/nas01" = {
    device = "/dev/disk/by-uuid/6a2a9094-9d62-49e2-aac7-d738e81f3be1";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
    ];
  };

  # Add users to the storage group
  systemd.tmpfiles.rules = [ "d /mnt/nas01 770 var roon-server" ];
}
