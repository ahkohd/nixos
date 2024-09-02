{ config, pkgs, ... }:

{
  services.mullvad-vpn = { enable = true; };

  environment.systemPackages = with pkgs; [
    mullvad
    mullvad-vpn
    mullvad-closest
  ];

  # systemd.services."mullvad-daemon".postStart =
  #   let mullvad = config.services.mullvad-vpn.package;
  #   in ''
  #     while ! ${mullvad}/bin/mullvad status >/dev/null; do sleep 1; done
  #     ${mullvad}/bin/mullvad auto-connect set on
  #     # ${mullvad}/bin/mullvad tunnel ipv6 set on
  #     ${mullvad}/bin/mullvad set default \
  #         --block-ads --block-trackers --block-malware
  #   '';
}
