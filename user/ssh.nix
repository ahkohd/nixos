{ ... }:

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

      Host devbox
        HostName victor.computer
        User var
        IdentityFile ~/.ssh/id_var
        IdentitiesOnly yes
        AddKeysToAgent yes
    '';
  };
}
