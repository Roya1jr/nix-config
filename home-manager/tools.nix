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
    common = with pkgs-unstable; [
      ######CLI Tools######
      carapace
      chafa
      devenv
      inetutils
      jujutsu
      lazyjj
      libsixel
      license-generator
      rlwrap
      pciutils
      tree
      television
      zellij

      ###ZSH###
      zsh
      zsh-autocomplete
      ###

      ############

      ######Development Tools#####
      sqlc
      sql-studio
      buf
      helixmaster
      just
      ffmpeg_7-headless
      gdb
      git-filter-repo
      gnumake
      quicktype
      tree-sitter

      ###Podman###
      buildah
      podman
      podman-compose
      skopeo
      ###

      ###Databases###
      sqld
      tigerbeetle
      postgresql
      libpq
      ###

      ############

    ];
    linuxOnly = with pkgs-unstable; [

      ###Podman###
      runc
      crun
      ###

      fontfor
      traceroute
      openvpn3

      ollama
      pi-coding-agent
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
