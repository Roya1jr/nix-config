{ pkgs, pkgs-unstable, user, lib, ... }:

let
  sharedPackages = with pkgs; [
    # CLI
    fontfor
    traceroute
    pkgs-unstable.ollama

    # Programming
    glibc
    gfortran14
    libclang
    xorg.libX11

    pkgs-unstable.factor-lang
    hare
    (lib.hiPrio pkgs-unstable.j)

    # Broken / commented packages
    # io
    # qnial
    racket
  ];
in
{
  # System services and settings
  services.printing.enable = true;
  services.openssh.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.containers.enable = true;

  # User accounts
  users.mutableUsers = true;
  users.users.${user} = {
    shell = pkgs.zsh;
    description = "Me";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
  };

  # Programs
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # Home-manager for the shared packages
  home-manager.users.${user} = { system, pkgs-unstable, ... }:
  {
    home.packages = sharedPackages;
    home.file = { };
  };
}

