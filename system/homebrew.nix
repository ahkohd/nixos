{ homebrew-core, homebrew-cask, homebrew-bundle, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "var";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
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

    casks = [
      "1password"
      "obsidian"
      "raycast"
      "google-drive"
      "polypane"
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
      "sublime-text"
      "karabiner-elements"
      "chatgpt"
      "zed"
      "zen-browser"
      "slack"
      "discord"
      "google-chrome"
    ];

    masApps = {
      "1password for Safari" = 1569813296;
      "Save to Raindrop.io" = 1549370672;
      "Save to Reader" = 1640236961;
      "Cursor Pro" = 1447043133;
      "Keystroke Pro" = 1572206224;
      Couverture = 1552415914;
      Xcode = 497799835;
      HazeOver = 430798174;
      Amphetamine = 937984704;
    };
  };
}
