{ ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Victor Aremu";
        email = "me@victorare.mu";
      };
      signing = {
        behavior = "own";
        backend = "gpg";
        key = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD";
      };
      ui = {
        pager = "difft";
        diff-editor = [ "nvim" "-c" "DiffEditor $left $right $output" ];
        diff-formatter = [ "difft" "--color=on" "$left" "$right" ];
      };
      snapshot = { max-new-file-size = 6110460; };
    };
  };

}
