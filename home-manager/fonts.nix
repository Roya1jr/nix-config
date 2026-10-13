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
      monaspace
      monaspace-script-nerd
      maple-mono.NF-CN
      nerd-fonts.annotationmono
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.victor-mono


    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
