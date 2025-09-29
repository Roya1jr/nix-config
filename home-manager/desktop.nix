# home-manager/desktop.nix (Revised to return a Home Manager Module)
{ pkgs, ... }:

{
  # This is the Home Manager option for packages
  home.packages = with pkgs; [
    # Packages should be explicitly prefixed (pkgs-unstable, etc.) 
    # since we are inside a module, not a top-level 'with pkgs;' block.

    #######Programming##########
    (dyalog.override { acceptLicense = true; })
    lmstudio
    #######Programming##########

    ###GUI###
    hyprland
    wezterm
    #########

    ##Editors##
    ride
    vscode
    ###########
  ];
}
