{ config
, lib
, pkgs
, ...
}: {
  programs.zsh = {
    history = {
      extended = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    initExtraBeforeCompInit = ''
      # p10k instant prompt
      local P10K_INSTANT_PROMPT="${config.xdg.cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
    '';

    initExtra = ''
      ${lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        if [[ -d /opt/homebrew ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
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
