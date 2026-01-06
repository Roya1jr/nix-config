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
