{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [ rofi ];
}
