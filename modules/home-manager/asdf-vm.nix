{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    asdf-vm
  ];

  programs.zsh = {
    initContent = ''
      . "${pkgs.asdf-vm}/etc/profile.d/asdf-prepare.sh"
      source "${config.xdg.configHome}/asdf-direnv/zshrc"
    '';
  };

  home.file = {
    ".asdfrc".text = '''
      legacy_version_file = yes
      java_macos_integration_enable = yes
    '';
  };
}
