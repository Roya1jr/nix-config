{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nixos.nix
    ../shared.nix
  ];
  environment.systemPackages = [
    pkgs.home-manager
    pkgs.kdePackages.partitionmanager
  ];

  programs = {
    kdeconnect = {
      enable = true;
    };
  };
  system.stateVersion = "24.11";

  nix = {
    package = pkgs.nix;
  };
  home-manager.users.prince =
    { ... }:
    {

      ### Installed Settings####
      programs = {};
      ################
    };

  ###Settings####
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  ###############

  ###Services####
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "prince";
  };
  services.xserver.videoDrivers = [ "modesetting" ];
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
  ##############

}
