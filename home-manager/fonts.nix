{ pkgs, pkgs-unstable, ... }:

with pkgs;
[
  pkgs-unstable.hack-font
  pkgs-unstable.julia-mono
  pkgs-unstable.noto-fonts
  pkgs-unstable.redhat-official-fonts
  pkgs-unstable.uiua386
  (pkgs.nerdfonts.override {
      fonts = [
        "IBMPlexMono"
        "Iosevka"
        "IosevkaTerm"
        "FantasqueSansMono"
      ];
    })
]
