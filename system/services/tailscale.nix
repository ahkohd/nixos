{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ tailscale davfs2 ];

  services.tailscale.enable = true;

  services.davfs2.enable = true;
  services.davfs2.davUser = "var";
}

