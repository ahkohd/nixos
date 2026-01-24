{ pkgs, ... }:

let
  nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };

in {
  environment.systemPackages = [
    nvim-config
  ];
}
