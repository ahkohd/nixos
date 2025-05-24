{ ... }: {
  home.file."/.npmrc".text = ''
    prefix = ''${HOME}/.npm-packages
  '';
}
