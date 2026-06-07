{ pkgs }:
with pkgs; [
  nodejs_24
  gcc
  tree-sitter
  lua51Packages.luacheck
  lua51Packages.luarocks-nix
  lua-language-server
  stylua
  ripgrep
  fd
  zoxide
  mprocs
  marksman
  nixfmt-classic
  nixd
  openssh
  libfido2
  yubikey-manager
  create-dmg
  difftastic
  moor
  uv
  github-mcp-server
  stylua
  lazyssh
  atuin
  python312
  eslint
  stow
  prmt
  fzf
  bat
  lazygit
  gh
  go
  jujutsu
  eza
  yazi
  tart
  (import ../packages/zmx.nix { inherit pkgs; })
  (import ../packages/beads.nix {
    inherit pkgs;
  }) # pinned 0.62.0 (nixpkgs ships 0.27.2)
  dolt
  pass
]
