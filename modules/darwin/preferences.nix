{ ... }: {
  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;

      wvous-bl-corner = 1; # Disabled
      wvous-br-corner = 1; # Disabled
      wvous-tl-corner = 1; # Disabled
      wvous-tr-corner = 1; # Disabled
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 0;
      ShowDayOfWeek = true;
      ShowSeconds = true;
    };

    screensaver = {
      askForPassword = true;
    };
  };
}
