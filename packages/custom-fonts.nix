{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "custom-fonts";
  version = "0.0.0";
  src = builtins.fetchGit {
    url = "git@github.com:ahkohd/nix-fonts";
    rev = "db873ba0c1724c33f241130fb32663788aa17d04";
  };

  installPhase = ''
    mkdir -p $out/bin

    cp -r $src/scripts/custom-fonts $out/bin/custom-fonts

    chmod +x $out/bin/custom-fonts
  '';
}
