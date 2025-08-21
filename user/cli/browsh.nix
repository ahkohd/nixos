{ ... }: {
  home.file."/Users/var/Library/Application Support/browsh/config.toml".text =
    ''
      browsh_supporter = "I have shown my support for Browsh"

      [firefox]
      profile = "default-browsh"
      # use-existing = true
    '';
}
