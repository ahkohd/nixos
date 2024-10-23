{ ... }:

{
  programs.lazygit.enable = true;

  home.file.".config/lazygit/config.yml".text = ''
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
          - "#ff966c"
          - "bold"
        inactiveBorderColor:
          - "#589ed7"
        searchingActiveBorderColor:
          - "#ff966c"
          - "bold"
        optionsTextColor:
          - "#82aaff"
        selectedLineBgColor:
          - "#2d3f76"
        cherryPickedCommitFgColor:
          - "#82aaff"
        cherryPickedCommitBgColor:
          - "#c099ff"
        markedBaseCommitFgColor:
          - "#82aaff"
        markedBaseCommitBgColor:
          - "#ffc777"
        unstagedChangesColor:
          - "#c53b53"
        defaultFgColor:
          - "#c8d3f5"
  '';
}
