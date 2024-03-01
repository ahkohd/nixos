{ pkgs, inputs, config, ... }:

{
  environment.systemPackages = with pkgs; [ age sops ];

  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/var/.config/sops/age/keys.txt";

  # secrets

  sops.secrets.tn_token = { };
  sops.secrets.tn_repo_url = { };
}
