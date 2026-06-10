{ pkgs-unstable, ... }:

{

  home = {
    packages = with pkgs-unstable; [

      #######Programming##########
      lmstudio
      #######Programming##########

      ###GUI###
      ghostty
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
