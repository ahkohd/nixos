{ config, pkgs, ... }:

{

  hardware.pulseaudio.enable = true;

  # Add user to audio group
  users.extraUsers.var.extraGroups = [ "audio" ];

  environment.systemPackages = with pkgs; [ pavucontrol uxplay ];
}
