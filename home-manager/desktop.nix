{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [

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
