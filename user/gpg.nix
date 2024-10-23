{ ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      use-agent = true;
      pinentry-mode = "loopback";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultCacheTtl = 28800;
    maxCacheTtl = 28800;
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };
}
