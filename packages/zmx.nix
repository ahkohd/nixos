{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "zmx";
  version = "0.6.0";

  src = pkgs.fetchurl {
    url =
      "https://github.com/neurosnap/zmx/releases/download/v${finalAttrs.version}/zmx-${finalAttrs.version}-macos-aarch64.tar.gz";
    hash = "sha256-PwcMbjjLOkjdwTHb6Vb9TE6/TKbPzFfDrLtAmU8Wl4c=";
  };

  sourceRoot = ".";
  nativeBuildInputs = [ pkgs.installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 zmx $out/bin/zmx
    installShellCompletion --cmd zmx \
      --bash <($out/bin/zmx completions bash) \
      --fish <($out/bin/zmx completions fish) \
      --zsh <($out/bin/zmx completions zsh)
    runHook postInstall
  '';

  meta = {
    description = "Session attach/detach for the terminal";
    homepage = "https://github.com/neurosnap/zmx";
    mainProgram = "zmx";
    platforms = [ "aarch64-darwin" ];
  };
})
