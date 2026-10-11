{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      ghostty
      itch
      rio
      vicinae
      wezterm
      zed-editor
    ];

    file = {

    };

  };
}
