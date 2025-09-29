# home-manager/desktop.nix (Revised to return a Home Manager Module)
{ pkgs, pkgs-unstable, ... }:

{
  # This is the Home Manager option for packages
  home.packages = with pkgs; [
    # Packages should be explicitly prefixed (pkgs-unstable, etc.) 
    # since we are inside a module, not a top-level 'with pkgs;' block.

    #######Programming##########
    (pkgs-unstable.dyalog.override { acceptLicense = true; })
    pkgs-unstable.lmstudio
    #######Programming##########

    ###GUI###
    pkgs-unstable.hyprland
    pkgs-unstable.wezterm
    #########

    ##Editors##
    pkgs-unstable.ride
    pkgs-unstable.vscode
    ###########
  ];
}
