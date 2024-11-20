{ ... }: {

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Victor Aremu";
        email = "me@victorare.mu";
      };
      signing = {
        sign-all = true;
        backend = "gpg";
        key = "1F76A9056C921C8A004F63E28D43F8A176DDC6BD";
      };
    };
  };

}