{ system, pkgs, jj_tui, ... }:

let jujutsu_tui = jj_tui.packages.${system}.default;

in { environment.systemPackages = [ jujutsu_tui pkgs.jujutsu ]; }
