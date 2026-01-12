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
      bat
      coreutils-full
      fastfetch
      fd
      git
      gzip
      htop
      jq
      jujutsu
      lsd
      lsof
      openssh
      openssl
      parallel
      ripgrep
      rsync
      sshs
      sqlite
      starship
      tlrc
      unzip
      wget
      zip
      zoxide
    ];
    linuxOnly = [
      wl-clipboard
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
