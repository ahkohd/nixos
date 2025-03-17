{ system, pkgs, ghostty, zen-browser, ... }:

let
  nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };
  custom-fonts = import ../packages/custom-fonts.nix { inherit pkgs; };
  _ghostty = ghostty.packages.${system}.default;
  zen = zen-browser.packages."${system}".default;

in { environment.systemPackages = [ nvim-config custom-fonts _ghostty zen ]; }
