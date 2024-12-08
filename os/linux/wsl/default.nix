{ pkgs, system, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../shared.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "prince";
  wsl.extraBin = with pkgs; [
    { src = "${coreutils}/bin/uname"; }
  ];
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
          userName = "Prince Junior Mguni";
          userEmail = "princem@bestforu.co.za";
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
    };
}
