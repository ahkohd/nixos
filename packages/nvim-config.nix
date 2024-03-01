{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "nvim-config";
  version = "0.0.0";
  src = builtins.fetchGit {
    url = "https://github.com/ahkohd/nvim.git";
    rev = "895701f62118fc7078d323ace49934428d50e0a8";
  };

  installPhase = ''
    mkdir -p $out/bin

    cp -r $src/scripts/nvim-config $out/bin/nvim-config

    chmod +x $out/bin/nvim-config
  '';
}

