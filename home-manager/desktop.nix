{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      ghostty
      itch
      rio
      vicinae
      zed-editor
    ];

    file = {

    };

  };
}
