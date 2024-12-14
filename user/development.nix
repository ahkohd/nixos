{ pkgs }:
with pkgs; [
  firefox-devedition-bin

  ungoogled-chromium

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

  mprocs

  delta

  zrok

  marksman

  nitch

  nixd
]
