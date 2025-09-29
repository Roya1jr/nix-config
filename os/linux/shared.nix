{
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  ...
}:
{
  services.printing.enable = true;
  services.openssh.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  virtualisation.containers.enable = true;
  users = {
    mutableUsers = true;
    users = {
      prince = {
        shell = pkgs.zsh;
        description = "Me";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "dialout"
        ];
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
    nix-ld.enable = true;
  };
  home-manager.users.prince =
    { system, pkgs-unstable, ... }:
    {
      home = {
        file = {

        };
        packages = with pkgs; [
          #######CLI##########
          fontfor
          traceroute
          pkgs-unstable.ollama
          ######################

          #######Programming#########

          ##C++#
          glibc
          gfortran14
          libclang
          xorg.libX11
          ######

          pkgs-unstable.factor-lang
          hare
          (lib.hiPrio pkgs-unstable.j)

          ##Broken
          #io

          #Broken
          ##qnial
          racket

          ####################
        ];
      };

    };

}
