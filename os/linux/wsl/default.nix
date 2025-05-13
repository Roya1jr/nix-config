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
  system.stateVersion = "24.11";
  home-manager.users.prince =
    { ... }:
    {
      home = {
        packages = with pkgs;[

        ];

      };

      programs = {
        zsh.enableCompletion = false;
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
