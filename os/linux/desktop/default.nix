{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../nixos.nix
    ../shared.nix
  ];
  environment.systemPackages =
    [
      pkgs.home-manager
    ];

  system.stateVersion = "24.11";

  nix = {
    package = pkgs.nix;
  };
  home-manager.users.prince =
    { ... }:
    {
      home = {
        packages = with pkgs;[


        ];
      };

      ### Installed Settings####
      programs = {
        git = {
          enable = true;
          userName = "Prince Junior Mguni";
          userEmail = "prince.mguni@outlook.com";
          ignores = [ "*node_modules" ];
          extraConfig = {
            init = {
              defaultBranch = "main";
            };
            safe = {
              directory = "/etc/nixos";
            };
            pull.rebase = true;
          };
        };
      };
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
  ###Settings####

  ###Services####
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "prince";
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
  ##############

  programs = {
    zsh.enable = true;
  };


}
