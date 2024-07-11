{

  description = "Yay! A snow flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    sops-nix.url = "github:Mic92/sops-nix";

    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    zjstatus.url = "github:dj95/zjstatus";

    yazi.url = "github:sxyazi/yazi";

    md-tui.url = "github:henriklovhaug/md-tui";
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

        modules = [ ./home.nix (import ./overlays.nix) ];
      };
    };
}
