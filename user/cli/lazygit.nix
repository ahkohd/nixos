{ config, pkgs, ... }:

{
  programs.lazygit.enable = true;

  home.file.".config/lazygit/config.yml".text = ''
    os:
      editPreset: "nvim"
    customCommands:
      - key: "C"
        command: "git cz c"
        description: "commit with commitizen"
        context: "files"
        loadingText: "opening commitizen commit tool"
        subprocess: true
  '';
}
