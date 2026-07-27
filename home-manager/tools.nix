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
      ######CLI Tools######
      carapace
      pkgs-unstable.chafa
      pkgs-unstable.devenv
      inetutils
      pkgs-unstable.jujutsu
      pkgs-unstable.lazyjj
      pkgs-unstable.libsixel
      license-generator
      rlwrap
      pciutils
      tree
      pkgs-unstable.television
      pkgs-unstable.zellij

      ###ZSH###
      zsh
      zsh-autocomplete
      ###

      ############

      ######Development Tools#####
      pkgs-unstable.sqlc
      pkgs-unstable.buf
      helixmaster
      ffmpeg_7-headless
      gdb
      git-filter-repo
      gnumake
      pkgs-unstable.quicktype
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
      pkgs-unstable.postgresql
      libpq
      ###

      ############

    ];
    linuxOnly = [
      
      ###Podman###
      runc
      crun
      ###
      
      fontfor
      traceroute
      openvpn3
      
      pkgs-unstable.ollama
      pkgs-unstable.opencode
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
