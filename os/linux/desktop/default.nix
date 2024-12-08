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

  programs = {
    zsh.enable = true;
  };


}
