{ config, pkgs, ... }:

{
  services.github-runners = {
    tn-runner1 = {
      enable = true;
      name = "naruto";
      tokenFile = config.sops.secrets."tn_token".path;
      url = "https://github.com/t3rn/frontend";
    };
    tn-runner2 = {
      enable = true;
      name = "sasuke";
      tokenFile = config.sops.secrets."tn_token".path;
      url = "https://github.com/t3rn/frontend";
    };
  };
}
