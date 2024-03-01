{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "hyprshot";
  version = "1.0";
  src = builtins.fetchGit {
    url = "https://github.com/Gustash/Hyprshot.git";
    rev = "36dbe2e6e97fb96bf524193bf91f3d172e9011a5";
  };

  # see https://nixos.org/nixpkgs/manual/#ssec-install-phase
  # $src is defined as the location of our `src` attribute above
  installPhase = ''
    # $out is an automatically generated filepath by nix,
    # but it's up to you to make it what you need. We'll create a directory at
    # that filepath, then copy our sources into it.

    mkdir -p $out/bin

    cp $src/hyprshot $out/bin/hyprshot

    chmod +x $out/bin/hyprshot
  '';
}

