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
    casks = [
      "1password"
      "firefox@developer-edition"
      "obsidian"
      "eloston-chromium"
      "raycast"
      "google-drive"
      "polypane"
      "slack"
      "discord"
      "reader"
      "pixelsnap"
      "cleanmymac"
      "xnapper"
      "figma"
      "spotify"
      "roon"
      "arc"
      "screen-studio"
    ];

    masApps = {
      "1password for Safari" = 1569813296;
      Vimari = 1480933944;
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
