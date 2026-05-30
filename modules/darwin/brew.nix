{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    global = {
      brewfile = true;
    };

    taps = [
      "1password/tap"
      "aws/tap"
    ];

    brews = [
      "age"
      "awscli"
      "chezmoi"
      "curl"
      "fswatch"
      "gh"
      "gifsicle"
      "git"
      "git-lfs"
      "go"
      "htop"
      "jq"
      "lynx"
      "m1ddc"
      "magic-wormhole"
      "mas"
      "mosh"
      "mtr"
      "nmap"
      "node"
      "nvm"
      "pandoc"
      "picocom"
      "pv"
      "rclone"
      "screenresolution"
      "terraform"
      "uv"
      "watch"
      "watchman"
      "wget"
      "ykman"
      "ykpers"
      "yt-dlp"
      "yubico-piv-tool"
    ];

    casks = [
      "1password"
      "1password-cli"
      "appcleaner"
      "archiver-app"
      "arq"
      "coconutbattery"
      "dash"
      "daisydisk"
      "docker-desktop"
      "elgato-stream-deck"
      "firefox"
      "google-chrome"
      "handbrake-app"
      "hex-fiend"
      "jordanbaird-ice"
      "inkscape"
      "insomnia"
      "iterm2"
      "monitorcontrol"
      "obs"
      "pdf-expert"
      "rectangle"
      "secretive"
      "sourcetree"
      "utm"
      "visual-studio-code"
      "vlc"
      "wireshark-app"
      "yubico-authenticator"
    ];


    masApps = {
      # iLife/iWork
      "GarageBand" = 682658836;
      "iClip" = 468369783;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;

      "Amphetamine" = 937984704;
      "Broadcasts" = 1469995354;
      "Brother P-touch Editor" = 1453365242;
      "Home Assistant" = 1099568401;
      "Ivory" = 6444602274;
      "Parcel" = 375589283;
      "Speedtest" = 1153157709;
      "TestFlight" = 899247664;
      "Xcode" = 497799835;
    };
  };
}
