{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/ssh.nix
    ./system/packages.nix
    ./system/services/audio/roon.nix
    ./system/services/smartcard.nix
    ./system/services/tailscale.nix
    ./system/services/glance.nix
    ./system/services/caddy.nix
    ./system/services/podman.nix
    ./system/services/hermes.nix
  ];

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

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

  console.keyMap = "us";

  programs.zsh.enable = true;

  users.groups.plugdev = { };

  users.users.var = {
    isNormalUser = true;
    description = "Victor Aremu";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "podman" ];
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

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ ];

  networking.firewall.allowedUDPPorts = [ ];

  networking.firewall.enable = true;

  security.sudo.extraRules = [
    {
      users = [ "var" ];
      commands = [
        { command = "/run/current-system/sw/bin/systemctl restart podman-*"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/systemctl restart caddy"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/systemctl restart glance"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/systemctl restart roon-server"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

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
