{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ roon-server ];

  services.roon-server = {
    enable = true;
    openFirewall = true;
  };
}
