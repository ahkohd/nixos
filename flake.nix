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

    # ghostty = {
    #   type = "git";
    #   url = "ssh://git@github.com/ghostty-org/ghostty";
    #   inputs.nixpkgs-stable.follows = "nixpkgs";
    #   inputs.nixpkgs-unstable.follows = "nixpkgs";
    # };

    sops-nix.url = "github:Mic92/sops-nix";

    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    yazi.url = "github:sxyazi/yazi";

    # zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, nur, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          # inherit ghostty;
          # inherit zen-browser;
        };

        modules = [

          nur.nixosModules.nur

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
