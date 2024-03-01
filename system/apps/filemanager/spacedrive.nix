{ config, pkgs, ... }:
let spacedrive = import ../../../packages/spacedrive.nix { inherit pkgs; };
in { environment.systemPackages = with pkgs; [ spacedrive ]; }
