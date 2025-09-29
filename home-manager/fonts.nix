{
  pkgs,
  pkgs-unstable,
  system,
  lib,
  ...
}:

with pkgs;
(
  let
    isLinux = builtins.elem system [
      "x86_64-linux"
      "aarch64-linux"
    ];
    common = [
      pkgs-unstable.hack-font
      pkgs-unstable.julia-mono
      pkgs-unstable.noto-fonts
      pkgs-unstable.redhat-official-fonts
      pkgs-unstable.uiua386
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
