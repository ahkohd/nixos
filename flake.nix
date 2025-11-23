{
  description = "Victor's Darwin System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { home-manager, darwin, nix-homebrew, homebrew-core, homebrew-cask
    , homebrew-bundle, ... }@inputs:

    let
      system = "aarch64-darwin";
      themeFile = ./.theme;
      colorscheme = if builtins.pathExists themeFile then
        builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile themeFile)
      else
        "dark";
    in {
      darwinConfigurations = {
        homestead-2 = darwin.lib.darwinSystem {
          inherit system;

          specialArgs = {
            inherit homebrew-core;
            inherit homebrew-cask;
            inherit homebrew-bundle;
          };

          modules = [
            nix-homebrew.darwinModules.nix-homebrew

            ./configuration.nix

            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs colorscheme; };
                users.var = import ./home.nix;
              };
              users.users.var.home = "/Users/var";
            }
          ];
        };
      };
    };
}
