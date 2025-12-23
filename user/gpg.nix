{ pkgs, ... }:

{
  # GPG: install binary & launchd agent service.
  # gpg.conf and gpg-agent.conf are managed by stow (~/dotfiles/gnupg).

  home.packages = [ pkgs.gnupg ];
}
