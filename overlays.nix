{ config, pkgs, lib, inputs, ... }:

let
  roon-server = (self: super: {
    # https://github.com/NixOS/nixpkgs/pull/292253
    roon-server = (import (builtins.fetchTarball {
      url =
        "https://github.com/NixOS/nixpkgs/archive/aaab0c5c0c074d8f90ebe94827839d11e446eea9.tar.gz";
      sha256 = "1a440d07vwy310jx77j9jsk2m7hlg2vdycg0hnahz6fv8mx5mvdl";
    }) {
      localSystem = "x86_64-linux";
      config = { allowUnfree = true; };
    }).roon-server;
  });
  neovide = (self: super: {
    # https://github.com/NixOS/nixpkgs/pull/312630
    neovide = (import (builtins.fetchTarball {
      url =
        "https://github.com/NixOS/nixpkgs/archive/0fe111d1c7dc0c2851072569ae17ce5e71325c29.tar.gz";
      sha256 = "06s62kjkk79hp8bnj8mys28lv16h7zx50fwyq73wpxygg67a3c9i";
    }) {
      localSystem = "x86_64-linux";
      config = { allowUnfree = true; };
    }).neovide;
  });
in {
  nixpkgs.overlays = with inputs; [
    roon-server

    neovim-nightly-overlay.overlay

    neovide

    yazi.overlays.default

    (final: prev: { zjstatus = zjstatus.packages.${prev.system}.default; })
  ];
}
