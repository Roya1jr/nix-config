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

      programs = {};
    };
}
