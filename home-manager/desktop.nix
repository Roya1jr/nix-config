{ pkgs-unstable, ... }:

{

  home = {
    packages = with pkgs-unstable; [

      #######Programming##########
      lmstudio
      #######Programming##########

      ###GUI###
      wezterm
      vicinae
      #########

      ##Editors##
      zed-editor
      ###########
    ];

    file = {

    };

  };
}
