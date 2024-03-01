{ config, pkgs, ... }:

let hyprshot = import ../../../packages/hyprshot.nix { inherit pkgs; };
in {

  environment.systemPackages = with pkgs; [
    hyprshot
    slurp
    grim
    libnotify
    jq
    swappy
  ];

}
