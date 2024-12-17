{ ... }:

{
  system.defaults = {
    CustomUserPreferences = {
      # Disable Creation of Metadata Files on Network Volumes
      "com.apple.desktopservices".DSDontWriteNetworkStores = true;
      # Disable Creation of Metadata Files on USB Volumes
      "com.apple.desktopservices".DSDontWriteUSBStores = true;

      # Disable Disk Image Verification
      # "com.apple.frameworks.diskimages" = {
      #   "skip-verify" = true;
      #   "skip-verify-locked" = true;
      #   "skip-verify-remote" = true;
      # };
    };

    dock = {
      # autohide dock
      autohide = true;
      autohide-delay = 0.0;

      # disable dock magnification
      magnification = false;

      # dock icons normal size
      tilesize = 64;

      # dock minimize/maximize effect
      mineffect = "scale";

      # minimize window to dock icon
      minimize-to-application = true;

      # dock position
      orientation = "left";

      persistent-apps = [ "/Applications/Ghostty.app" "/Applications/Arc.app" ];

      show-process-indicators = true;

      # hide recent apps in dock
      show-recents = false;

      static-only = true;

      # disable automatic space sort by recent use
      mru-spaces = false;

      # hot corners 
      wvous-bl-corner = 3; # Application windows
      wvous-br-corner = 4; # Desktop
      wvous-tl-corner = 2; # Mission control
      wvous-tr-corner = 12; # Notification center
    };

    finder = {
      # show all file extensions in Finder
      AppleShowAllExtensions = true;

      # show desktop icons
      CreateDesktop = true;

      # set search scope to current dir
      FXDefaultSearchScope = "SCcf";

      # disable change extension warning
      FXEnableExtensionChangeWarning = false;

      # set list view as default Finder view
      FXPreferredViewStyle = "clmv";
      QuitMenuItem = false;

      # show Finder path bar
      ShowPathbar = true;

      # show Finder status bar
      ShowStatusBar = true;

      _FXShowPosixPathInTitle = false;

      # show folders first
      _FXSortFoldersFirst = true;
    };

    loginwindow = {
      # disable guest acccount
      GuestEnabled = false;
    };

    screencapture = {
      # disable shadows when screenshotting windows
      disable-shadow = true;
    };

    NSGlobalDomain = {
      AppleFontSmoothing = 0;
      # enable full keyboard control
      AppleKeyboardUIMode = 3;

      # show all file extensions in Finder
      AppleShowAllExtensions = true;

      AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleEnableSwipeNavigateWithScrolls = false;
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleShowScrollBars = "WhenScrolling";

      "com.apple.keyboard.fnState" = true;

      # natural scroll direction
      "com.apple.swipescrolldirection" = true;

      "com.apple.mouse.tapBehavior" = 1;

      # trackpad tracking speed
      "com.apple.trackpad.scaling" = 10.0;

      # ** Keyboard
      # step sliders in UI are:
      # InitialKeyRepeat: 120, 94, 68, 35, 25, 15
      # KeyRepeat: 120, 90, 60, 30, 12, 6, 2
      # default is 25 and 6
      # multiply each by 15 to get milliseconds
      # result: 300ms ti start and 66.6... repeats per second
      # second
      InitialKeyRepeat = 12;
      KeyRepeat = 3;

      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = true;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;

      # disable auto correct
      NSAutomaticSpellingCorrectionEnabled = false;

      NSAutomaticWindowAnimationsEnabled = true;
      NSDocumentSaveNewDocumentsToCloud = false;

      # expand save panel by default
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;

      # expand print panel by default
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      NSScrollAnimationEnabled = true;
      NSTableViewDefaultSizeMode = 3;
      NSWindowShouldDragOnGesture = true;
      _HIHideMenuBar = false;
    };

    # mouse tracking speed
    ".GlobalPreferences"."com.apple.mouse.scaling" = 3.0;

    trackpad = {
      ActuationStrength = 0;

      # enable tap to click
      Clicking = true;

      # enable two fingers to right click
      TrackpadRightClick = true;

      # enable three finder drag
      TrackpadThreeFingerDrag = true;
    };

    menuExtraClock = {
      Show24Hour = false;
      ShowAMPM = true;
      ShowDate = 1;
    };

    spaces = { spans-displays = false; };

    WindowManager = {
      EnableStandardClickToShowDesktop = false;
      GloballyEnabled = false;
    };

    universalaccess = {
      closeViewScrollWheelToggle = true;
      closeViewZoomFollowsFocus = true;
      reduceMotion = false;
      reduceTransparency = false;
    };
  };

  system = {
    keyboard = {
      # enable keyboard mappings
      enableKeyMapping = true;

      # enable remap capslock to control
      remapCapsLockToControl = true;
    };
  };
}
