{ pkgs, ... }:
let
  minute = 60;
  hour = 60 * minute;
  day = 24 * hour;
in {
  programs.gpg = {
    enable = true;
    settings = { use-agent = true; };
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 1 * hour;
    defaultCacheTtlSsh = 1 * hour;
    maxCacheTtl = 1 * day;
    maxCacheTtlSsh = 1 * day;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentryPackage = pkgs.pinentry-tty;
    sshKeys = [ "15E03063349420441E70B693C05D522FE16DAB14" ];
  };
}
