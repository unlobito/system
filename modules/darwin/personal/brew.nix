{ ... }: {
  homebrew = {
    taps = [
      "rfidresearchgroup/proxmark3"
      "numworks/tap"
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
      "numworks/tap/arm-none-eabi-gcc"
      "platformio"
      "qdmr"
      "rfidresearchgroup/proxmark3/proxmark3"
      "rtl_433"
      "soapysdr"
      "telnet"
      "urh"
    ];

    casks = [
      "arduino"
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
      "MQTTX" = 1514074565;
      "Smart Card Utility" = 1444710309;
      "WhatsApp" = 1147396723;
    };
  };
}
