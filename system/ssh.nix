{ config, pkgs, ... }:

{
  services.openssh.extraConfig = ''
    PasswordAuthentication no

    PermitEmptyPasswords no

    UsePAM no

    ChallengeResponseAuthentication no

    PermitRootLogin no
  '';

  services.openssh.settings.PasswordAuthentication = false;

  users.users.var.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmyTBCigJkvxtEI3rSlZb3boT1J6Uvmb8VcXEO2FNOQ"
  ];
}
