{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    waypaper
    swaybg
    nwg-displays
    xdg-utils
  ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "sway";
    XDG_CURRENT_DESKTOP = "sway";
  };

  security.polkit.enable = true;

  hardware.graphics.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  xdg.portal.config.common.default = [ "*" ];
}
