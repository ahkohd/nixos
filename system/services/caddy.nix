{ pkgs, ... }: {
  environment.etc."cloudflare_token".source = /run/secrets/cloudflare_token;

  systemd.services.caddy.serviceConfig.EnvironmentFile =
    "/etc/cloudflare_token";

  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.2" ];
      hash = "sha256-7DGnojZvcQBZ6LEjT0e5O9gZgsvEeHlQP9aKaJIs/Zg=";
    };
    configFile = pkgs.writeText "Caddyfile" ''
      (cloudflare) {
        tls {
          dns cloudflare {env.ZONE01_CLOUDFLARE_API_TOKEN}
        }
      }

      home.victor.computer {
        reverse_proxy http://100.85.46.63:8081
        import cloudflare
      }

      charlotte.victor.computer {
        reverse_proxy http://127.0.0.1:18789
        import cloudflare
      }
    '';
  };
}
