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
      wl-clipboard
      zip
      zoxide
    ];
    linuxOnly = [

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
