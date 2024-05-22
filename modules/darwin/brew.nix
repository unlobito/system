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
      "homebrew/bundle"
      "homebrew/cask-versions"
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
      "archiver"
      "arq"
      "bartender"
      "coconutbattery"
      "dash"
      "docker"
      "elgato-stream-deck"
      "firefox"
      "google-chrome"
      "handbrake"
      "hex-fiend"
      "inkscape"
      "insomnia"
      "iterm2"
      "monitorcontrol"
      "obs"
      "obsbot-center"
      "pdf-expert"
      "rectangle"
      "secretive"
      "sourcetree"
      "visual-studio-code"
      "vlc"
      "wireshark"
      "yubico-authenticator"
      "yubico-yubikey-manager"
    ];


    masApps = {
      "GarageBand" = 682658836;
      "iClip" = 468369783;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Amphetamine" = 937984704;
      "Brother P-touch Editor" = 1453365242;
      "Home Assistant" = 1099568401;
      "Ivory" = 6444602274;
      "Speedtest" = 1153157709;
      "Xcode" = 497799835;
      "YubiKey Personalization Tool" = 638161122;
    };
  };
}
