{ ... }:

{
  # Minimal HM shell config. Only things that can't be done via stow.
  # All dotfile configs managed by stow (~/dotfiles/shell).

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
