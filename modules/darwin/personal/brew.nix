{ ... }: {
  homebrew = {
    taps = [
      "rfidresearchgroup/proxmark3"
    ];

    brews = [
      "libffi"
      "libfreefare"
      {
        name = "libnfc";
        args = [ "HEAD" ];
      }
      "mfcuk"
      {
        name = "mfoc";
        link = false;
      }
      "platformio"
      "qdmr"
      "rfidresearchgroup/proxmark3/proxmark3"
      "rtl_433"
      "soapysdr"
      "telnet"
      "urh"
    ];

    casks = [
      "audacity"
      "balenaetcher"
      "calibre"
      "chirp"
      "cubicsdr"
      "discord"
      "electrum"
      "ghidra"
      "gqrx"
      "keepassxc"
      "keybase"
      "knockknock"
      "krisp"
      "little-snitch"
      "lookingglassstudio"
      "monero-wallet"
      "nordvpn"
      "openscad"
      "oscar"
      "plex"
      "qflipper"
      "signal"
      "slack"
      "steam"
      "syncthing-app"
      "teamspeak-client"
      "telegram"
      "thonny"
      "tor-browser"
      "transmission"
      "transmit"
      "veracrypt"
    ];

    masApps = {
      "Apple Configurator" = 1037126344;
      "EchoHam" = 873302145;
      "Smart Card Utility" = 1444710309;
      "Tailscale" = 1475387142;
      "WhatsApp" = 310633997;
    };
  };
}
