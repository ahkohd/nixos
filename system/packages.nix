{ pkgs, ... }:

let
  custom-fonts = import ../packages/custom-fonts.nix { inherit pkgs; };

in { environment.systemPackages = [ custom-fonts ]; }
