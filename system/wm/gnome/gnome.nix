{ config, pkgs, inputs, ... }:

{
  services.displayManager.ly.enable = true;

  services.xserver = { desktopManager = { gnome = { enable = true; }; }; };

  environment.gnome.excludePackages = (with pkgs; [ gnome-photos gnome-tour ])
    ++ (with pkgs; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      gedit # text editor
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-contacts
      gnome-maps
      gnome-weather
      gnome-calculator
      gnome-calendar
      gnome-clocks
      gnome-doc-utils
      gnome-system-monitor
      gnome-text-editor
    ]);

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnomeExtensions.pop-shell
    gnomeExtensions.hide-top-bar
    # gnomeExtensions.blur-my-shell
    gnomeExtensions.unite
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

}

