{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      anydesk
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
