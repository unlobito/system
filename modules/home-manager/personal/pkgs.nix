{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    binwalk
    deno
    esptool
    ffmpeg
    gnupg
    goaccess
    graphviz
    hackrf
  ];
}
