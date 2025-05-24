{ config
, lib
, pkgs
, ...
}: {
  programs.zsh = {
    enable = true;

    history = {
      extended = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    initContent = ''
      # p10k instant prompt
      local P10K_INSTANT_PROMPT="${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"

      ${lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        ${lib.optionalString pkgs.stdenvNoCC.hostPlatform.isAarch64 ''
          if [[ -d /opt/homebrew ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
          fi
        ''}
        ${lib.optionalString pkgs.stdenvNoCC.hostPlatform.isx86_64 ''
          if [[ -f /usr/local/bin/brew ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
          fi
        ''}
      ''}
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./zsh-plugins/p10k;
        file = "p10k.zsh";
      }
      {
        name = "friday";
        src = lib.cleanSource ./zsh-plugins/friday;
        file = "friday.sh";
      }
      {
        name = "dirchanger";
        src = lib.cleanSource ./zsh-plugins/dirchanger;
        file = "dirchanger.zsh";
      }
    ];
  };
}
