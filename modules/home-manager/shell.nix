{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    initExtra = ''
      ${lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        if [[ -d /opt/homebrew ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
      ''}
      
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
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
    ];
  };
}
