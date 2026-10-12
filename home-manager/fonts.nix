{
  pkgs,
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
      hack-font
      inter
      julia-mono
      noto-fonts
      redhat-official-fonts
      uiua386
      bqn386
      googlesans-code
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      monaspace
      monaspace-script-nerd
      nerd-fonts.victor-mono
    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
