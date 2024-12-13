{ pkgs, ... }:

let
  nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };
  custom-fonts = import ../packages/custom-fonts.nix { inherit pkgs; };

in { environment.systemPackages = [ nvim-config custom-fonts ]; }
