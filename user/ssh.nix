{ ... }:

{
  home.file.".ssh/config".text = ''
    Host *
      IdentityAgent /home/var/.1password/agent.sock
  '';
}
