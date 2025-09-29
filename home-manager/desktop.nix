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
      #######Programming##########
      (pkgs-unstable.dyalog.override { acceptLicense = true; })
      pkgs-unstable.lmstudio
      #######Programming##########

      ###GUI###
      pkgs-unstable.hyprland
      pkgs-unstable.wezterm
      #########

      ##Editors##
      pkgs-unstable.ride
      pkgs-unstable.vscode
      ###########
    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
