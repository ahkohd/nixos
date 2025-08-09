{ pkgs, ... }: {
  environment.etc."tailscale_token".source = /run/secrets/tailscale_token;

  systemd.services.golink = {
    description = "GoLink URL shortener";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      EnvironmentFile = "/etc/tailscale_token";
      WorkingDirectory = "/var/lib/golink";
      ExecStart = "${pkgs.golink}/bin/golink -sqlitedb golink.db";
      Restart = "on-failure";
      User = "golink";
      Group = "golink";
    };
  };

  users.users.golink = {
    isSystemUser = true;
    group = "golink";
    home = "/var/lib/golink";
    createHome = true;
  };

  users.groups.golink = { };
}
