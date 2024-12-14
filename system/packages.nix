{ system, pkgs, ghostty, ... }:

let
  nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };
  custom-fonts = import ../packages/custom-fonts.nix { inherit pkgs; };
  _ghostty = ghostty.packages.${system}.default;

in { environment.systemPackages = [ nvim-config _ghostty ]; }
