{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [

      #######Programming##########
      (dyalog.override { acceptLicense = true; })
      lmstudio
      #######Programming##########

      ###GUI###
      hyprland
      wezterm
      vicinae
      #########

      ##Editors##
      ride
      vscode
      zed-editor
      ###########
    ];

    file = {

    };

  };
}
