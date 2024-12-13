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

  delta

  marksman

  nixfmt-classic

  nixd
]
