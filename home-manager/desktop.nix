{ pkgs-unstable, ... }:

{

  home = {
    packages = with pkgs-unstable; [
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
