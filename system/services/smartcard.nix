{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.pcsclite ];

  services.pcscd.enable = true;
  security.polkit.enable = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) { if (subject.isInGroup("wheel")) { return polkit.Result.YES; } })
  '';

  services.udev.extraRules = ''
    # Yubico YubiKey
    ACTION=="add|change", SUBSYSTEM=="usb", ATTRS{idVendor}=="1050", MODE="0660", GROUP="plugdev"
  '';
}
