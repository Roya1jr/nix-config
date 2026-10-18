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
    common = with pkgs; [
      ######CLI Tools######
      carapace
      chafa
      devenv
      delta
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

      ######Development Tools#####
      sqlc
      sql-studio
      buf
      just
      ffmpeg_7-headless
      gdb
      git-filter-repo
      gnumake
      python314Packages.huggingface-hub
      llama-cpp
      quicktype
      steelix
      tree-sitter


      ###Podman###
      buildah
      podman
      podman-compose
      skopeo


      ###Databases###
      sqld
      tigerbeetle
      postgresql
      libpq


    ];
    linuxOnly = with pkgs; [

      ###Podman###
      runc
      crun
      ###

      fontfor
      traceroute
      openvpn3
      ollama
      pi-coding-agent
      qemu
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
