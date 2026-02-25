{
  pkgs,
  ...
}:

{
  ############Programs####################
  programs = {
    openvpn3.enable = true;
    dconf.enable = true;
    kdeconnect = {
      enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  ########################################

  ##########Environment###############
  environment = {
    systemPackages = [
      pkgs.home-manager
      pkgs.kdePackages.partitionmanager
    ];
    plasma6 = {
      excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        konsole
        oxygen
      ];
    };
  };
  ####################################

  ##############ZSH####################
  zsh = {
    shellAliases = {
      zed = "zeditor";
    };
  };
  ####################################

}
