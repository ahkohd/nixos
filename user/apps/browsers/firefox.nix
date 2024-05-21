{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        isDefault = true;
        userChrome = ''
          #forward-button, #back-button {
            display: none;
          }
        '';
      };
    };
  };
}
