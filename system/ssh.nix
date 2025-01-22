{ pkgs, ... }:

{
  programs.ssh = { startAgent = false; };

  services.dbus.packages = [ pkgs.gcr ];

  services.openssh.extraConfig = ''
    PasswordAuthentication no

    PermitEmptyPasswords no

    UsePAM no

    ChallengeResponseAuthentication no

    PermitRootLogin no
  '';

  services.openssh.settings.PasswordAuthentication = false;

  users.users.var.openssh.authorizedKeys.keys = [
    # add public keys here
  ];
}
