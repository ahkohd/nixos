{ system, ghostty, ... }:

let gsty = ghostty.packages.${system}.default;

in { environment.systemPackages = [ gsty ]; }
