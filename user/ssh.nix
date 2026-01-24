{ ... }:

{
  home.file.".ssh/config".text = ''
    Host github.com
      IdentityFile ~/.ssh/id_ed25519
      IdentitiesOnly yes
  '';
}
