{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-utils
    wl-clipboard
    waypaper
    swaybg
    nwg-displays
    nwg-look
    fuzzel
  ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [
        # xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
  };

  xdg.portal.config.common.default = [ "*" ];
}
