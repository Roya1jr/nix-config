{
  ...
}:

{
  imports = [
    ./settings/hardware-configuration.nix
    ../shared.nix
    ./settings/flatpaks.nix
    ./settings/programs.nix
    ./settings/services.nix
    ./settings/system.nix
    ./settings/systemd.nix
  ];

  system.stateVersion = "24.11";

  home-manager.users.prince =
    { ... }:
    {

      imports = [ ../../../home-manager/desktop.nix ];

      ### Installed Settings####
      programs = { };
      ################
    };

  ###############

}
