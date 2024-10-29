{ pkgs, inputs, ... }:

let nvim-config = import ../packages/nvim-config.nix { inherit pkgs; };
in {
  environment.systemPackages = with pkgs; [
    ungoogled-chromium

    nodejs_22

    gcc

    tree-sitter

    nixfmt-classic

    lua51Packages.luacheck

    lua51Packages.luarocks-nix

    lua-language-server

    stylua

    vscode-extensions.vadimcn.vscode-lldb

    ripgrep

    fd

    bat

    zoxide

    nvim-config

    mprocs

    delta

    zrok

    marksman

    nitch

    nixd
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
