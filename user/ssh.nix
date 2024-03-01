{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host gh
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_github
        IdentitiesOnly yes
        AddKeysToAgent yes
    '';
  };
}
