{ inputs, ... }:

let
  roon-server = (self: super: {
    roon-server = (import (builtins.fetchTarball {
      url =
        "https://github.com/NixOS/nixpkgs/archive/aaab0c5c0c074d8f90ebe94827839d11e446eea9.tar.gz";
      sha256 = "1a440d07vwy310jx77j9jsk2m7hlg2vdycg0hnahz6fv8mx5mvdl";
    }) {
      localSystem = "x86_64-linux";
      config = { allowUnfree = true; };
    }).roon-server;
  });
in {
  nixpkgs.overlays = with inputs; [
    roon-server

    yazi.overlays.default
  ];
}
