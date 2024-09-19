{ config, pkgs, lib, inputs, ... }:

{
  nixpkgs.overlays = with inputs; [
    yazi.overlays.default
  ];
}
