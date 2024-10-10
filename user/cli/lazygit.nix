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

    gui:
      nerdFontsVersion: "3"
      theme:
        activeBorderColor:
          - "#ff9e64"
          - "bold"
        inactiveBorderColor:
          - "#29a4bd"
        searchingActiveBorderColor:
          - "#ff9e64"
          - "bold"
        optionsTextColor:
          - "#7aa2f7"
        selectedLineBgColor:
          - "#2e3c64"
        cherryPickedCommitFgColor:
          - "#7aa2f7"
        cherryPickedCommitBgColor:
          - "#bb9af7"
        markedBaseCommitFgColor:
          - "#7aa2f7"
        markedBaseCommitBgColor:
          - "#e0af68"
        unstagedChangesColor:
          - "#db4b4b"
        defaultFgColor:
          - "#c0caf5"
  '';
}
