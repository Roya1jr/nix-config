{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      anydesk
      ghostty
      itch
      rio
      rustdesk-flutter
      vicinae
      zed-editor
    ];

    file = {

    };

  };
}
