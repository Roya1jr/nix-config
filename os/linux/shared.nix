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

}
