{

  description = "Yay! A snow flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager/release-23.11";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };

        modules = [
          nur.nixosModules.nur

          ./configuration.nix

          (import ./overlays.nix)
        ];
      };

      homeConfigurations.var = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = { inherit inputs; };

        modules = [ ./home.nix ];
      };
    };
}
