{ ... }:

{

  security.acme = {
    acceptTerms = true;
    defaults.email = "computer@victorare.mu";
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "vite.aremu.dev" = {
        addSSL = true;
        enableACME = true;
        locations = {
          "/" = {
            proxyPass = "http://localhost:5173";
            proxyWebsockets = true;
          };
        };
      };
      "victor.computer" = {
        addSSL = true;
        enableACME = true;
        locations = { "/" = { return = "301 https://victorare.mu"; }; };
      };
    };
  };
}
