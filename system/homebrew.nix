{ homebrew-core, homebrew-cask, homebrew-bundle, homebrew-tw93
, homebrew-1jehuang, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "var";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "tw93/homebrew-tap" = homebrew-tw93;
      "1jehuang/homebrew-tap" = homebrew-1jehuang;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    brews = [ "tw93/tap/mole" "1jehuang/tap/mmdr" ];

    casks = [
      "1password"
      "obsidian"
      "raycast"
      "google-drive"
      "reader"
      "pixelsnap"
      "cleanmymac"
      "xnapper"
      "figma"
      "spotify"
      "roon"
      "sf-symbols"
      "linear-linear"
      "orbstack"
      "homerow"
      "gpg-suite"
      "karabiner-elements"
      "chatgpt"
      "zed"
      "slack"
      "legcord"
      "google-chrome"
      "alacritty"
      "kitty"
      "bettertouchtool"
      "docker-desktop"
      "linearmouse"
      "tailscale-app"
      "firefox"
      "whichspace"
      "vlc"
    ];

    masApps = {
      # "1password for Safari" = 1569813296;
      "Save to Raindrop.io" = 1549370672;
      "Save to Reader" = 1640236961;
      # "Cursor Pro" = 1447043133;
      "Keystroke Pro" = 1572206224;
      # Couverture = 1552415914;
      # Xcode = 497799835;
      # Amphetamine = 937984704;
      "Pixelmator Pro" = 1289583905;
    };
  };
}
