{ inputs, config, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.disko
    ./disk-config.nix
    ./devbox.nix
  ];

  system.stateVersion = "24.09";

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware.enableRedistributableFirmware = true;

  networking.hostName = "devbox";

  time.timeZone = "Africa/Lagos";

  environment.systemPackages = with pkgs; [ vim git home-manager ];

  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];

  networking.firewall.allowedUDPPorts = [ ];

  networking.firewall.enable = true;

  # boot.kernelParams = [ "net.ifnames=0" ];

  # boot.loader.grub = {
  #   efiSupport = true;
  #   efiInstallAsRemovable = true;
  # };

  users.users.var = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmyTBCigJkvxtEI3rSlZb3boT1J6Uvmb8VcXEO2FNOQ"
    ];
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    extraConfig = ''
      PrintLastLog no
    '';
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
