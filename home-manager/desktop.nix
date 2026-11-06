{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      anydesk
      ghostty
      itch
      vicinae
      zed-editor
    ];

    file = {

    };

  };
}
