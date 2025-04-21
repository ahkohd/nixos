{ pkgs }:
with pkgs; [
  nodejs_22

  gcc

  tree-sitter

  lua51Packages.luacheck

  lua51Packages.luarocks-nix

  lua-language-server

  stylua

  ripgrep

  fd

  bat

  zoxide

  mprocs

  marksman

  nixfmt-classic

  nixd

  openssh

  libfido2

  yubikey-manager

  create-dmg

  riffdiff

  moar
]
