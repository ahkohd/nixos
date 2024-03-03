{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ onagre ];
}
