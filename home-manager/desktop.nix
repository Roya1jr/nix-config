{ pkgs-stab, ... }:

{

  home = {
    packages = with pkgs-stab; [
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
