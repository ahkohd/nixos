{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "custom-fonts";
  version = "0.0.0";
  src = builtins.fetchGit {
    url = "git@github.com:ahkohd/nix-fonts";
    rev = "9c9a50c6181d1865dd3ce52b5270fa948ea0b23a";
  };

  installPhase = ''
    mkdir -p $out/bin

    cp -r $src/scripts/custom-fonts $out/bin/custom-fonts

    chmod +x $out/bin/custom-fonts
  '';
}
