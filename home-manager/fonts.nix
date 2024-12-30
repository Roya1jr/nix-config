{ pkgs,pkgs-unstable, ... }:

with pkgs; [
  hack-font
  julia-mono
  pkgs-unstable.nerd-fonts.fira-code
  pkgs-unstable.nerd-fonts.fantasque-sans-mono
  noto-fonts
  redhat-official-fonts
]
