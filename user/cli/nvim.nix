{ inputs, pkgs, ... }: {
  programs.neovim = {
    package =
      inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
