{ pkgs, ... }:

{
  imports = [
    ../shared.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "prince";
  wsl.extraBin = with pkgs; [
    { src = "${coreutils}/bin/uname"; }
  ];
  system.stateVersion = "24.11";
  home-manager.users.prince =
    { ... }:
    {
      home = {
        packages = with pkgs;[

        ];

      };

      programs = {
        git = {
          enable = true;       
          ignores = [ "*node_modules" ];
          settings = {
            user = {
              name = "Prince Junior Mguni";
              email = "princem@bestforu.co.za";
            };
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
    };
}
