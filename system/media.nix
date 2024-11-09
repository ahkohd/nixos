{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ libheif ];
}
