{ config, pkgs, ... }:

let nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };
in {
  environment.systemPackages = with pkgs; [
    google-chrome

    nodejs_21

    go
    gcc
    python3
    rustup
    lua

    tree-sitter

    # formatters & LSPs

    nixfmt-classic

    lua51Packages.luacheck
    lua51Packages.luarocks-nix
    stylua
    lua-language-server

    nodePackages.vim-language-server

    taplo

    yamlfmt

    nodePackages.typescript-language-server
    nodePackages.prettier
    prettierd
    nodePackages.eslint
    eslint_d
    biome

    nodePackages.vscode-html-languageserver-bin

    nodePackages.vscode-json-languageserver

    tailwindcss-language-server

    rust-analyzer

    vscode-extensions.vadimcn.vscode-lldb

    # editors

    neovide

    python311Packages.pip

    # tools

    ripgrep
    fd

    fnm

    bat

    eza

    zoxide

    jq

    nvim-config

    riff

    mprocs

    bandwhich

    delta
  ];
}
