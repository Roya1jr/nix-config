{ pkgs-unstable, ... }:

{

  home = {
    packages = with pkgs-unstable; [
      itch
      lmstudio
      rio
      wezterm
      vicinae
      zed-editor
    ];

    file = {

    };

  };
}
