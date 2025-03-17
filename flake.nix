{

  description = "A nix flake for my homelab";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "github:ghostty-org/ghostty";

    yazi.url = "github:sxyazi/yazi";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # hyprland.url = "github:hyprwm/Hyprland";

    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = { nixpkgs, home-manager, ghostty, zen-browser, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit ghostty;
          inherit zen-browser;
          # inherit hyprland;
        };

        modules = [
          ./configuration.nix

          ./overlays.nix
        ];
      };

      homeConfigurations.var = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        modules = [ ./home.nix (import ./overlays.nix) ];
      };
    };
}
