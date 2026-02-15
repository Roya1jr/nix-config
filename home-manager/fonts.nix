{
  pkgs-unstable,
  system,
  lib,
  ...
}:

with pkgs-unstable;
(
  let
    isLinux = builtins.elem system [
      "x86_64-linux"
      "aarch64-linux"
    ];
    common = [
      hack-font
      julia-mono
      noto-fonts
      redhat-official-fonts
      uiua386
      bqn386
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
