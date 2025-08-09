{ pkgs }:
with pkgs; [
  nodejs_22

  gcc

  tree-sitter

  nixfmt-classic

  lua51Packages.luacheck

  lua51Packages.luarocks-nix

  lua-language-server

  stylua

  ripgrep

  fd

  bat

  zoxide

  marksman

  nitch

  nixd

  libfido2

  yubikey-manager

  glow

  moar

  riffdiff
]
