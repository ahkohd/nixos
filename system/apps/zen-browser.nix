{ system, zen-browser, ... }:

let zen = zen-browser.packages.${system}.default;

in { environment.systemPackages = [ zen ]; }
