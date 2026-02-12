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
      pkgs-unstable.ollama
      pkgs-unstable.devenv
      pkgs-unstable.jujutsu
      pkgs-unstable.lazyjj
      #####ZSH#####
      zsh
      zsh-autocomplete
      ############

      ## Desktop Tools

      ##

      # Development Tools
      pkgs-unstable.buf
      pkgs-unstable.helix
      gdb
      gnumake
      git-filter-repo
      ffmpeg_7-headless
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
      openvpn3
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
