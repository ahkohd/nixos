# Pins beads (bd) 1.0.4. nixpkgs only ships 0.27.2, which lacks the `dolt`
# backend and `linear` integration that the .beads/ data
{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "beads";
  version = "1.0.4";

  src = pkgs.fetchurl {
    url =
      "https://github.com/steveyegge/beads/releases/download/v${finalAttrs.version}/beads_${finalAttrs.version}_darwin_arm64.tar.gz";
    hash = "sha256-DFNHn+oHChyr6Osx44JNdMVkOx3spxpf6DLr046e+Hc=";
  };

  sourceRoot = ".";
  nativeBuildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    runHook preInstall
    install -Dm755 bd $out/bin/bd
    # bd shells out to dolt (server) and git - keep them on its PATH.
    wrapProgram $out/bin/bd --prefix PATH : ${
      pkgs.lib.makeBinPath [ pkgs.dolt pkgs.git ]
    }
    ln -s bd $out/bin/beads
    runHook postInstall
  '';

  meta = {
    description =
      "Beads (bd) — dependency-aware issue tracker, pinned 0.62.0 (Dolt & Linear)";
    homepage = "https://github.com/steveyegge/beads";
    mainProgram = "bd";
    platforms = [ "aarch64-darwin" ];
  };
})
