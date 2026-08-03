{ pkgs-unstable, ... }:

{

  home = {
    packages = with pkgs-unstable; [
      itch
      rio
      wezterm
      vicinae
      zed-editor
    ];

    file = {

    };

  };
}
