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
      # CLI Tools
      license-generator
      carapace
      fish
      rlwrap
      tree
      pkgs-unstable.devenv

      #####ZSH#####
      zsh
      zsh-autocomplete
      ############

      ## Desktop Tools
      pkgs-unstable.libation
      ##

      # Development Tools
      pkgs-unstable.helix
      gdb
      gnumake
      fly
      git-filter-repo

      # Podman and Container Tools
      buildah
      podman
      podman-compose
      skopeo

      # Databases
      sqld
      tigerbeetle

      # Other Dev Tools
      tree-sitter

    ];
    linuxOnly = [

      fontfor
      traceroute
      pkgs-unstable.ollama
      openvpn3
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
