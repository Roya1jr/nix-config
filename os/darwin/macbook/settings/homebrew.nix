{ ... }:
{
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [
        "--force"
      ];
    };

    casks = [
      ########GUI#########
      "anytype"
      "anki"
      "audacity"
      "arduino-ide"
      "blender@lts"
      "bruno"
      "dbeaver-community"
      "devtoys"
      "fontforge"
      "google-chrome"
      "godot"
      "jdownloader"
      "lm-studio"
      "material-maker"
      "mochi"
      "obsidian"
      "pixieditor"
      "raycast"
      "super-productivity"
      "tablecruncher"
      "wezterm"
      "zen"
      "zed"
      ####################

      "j"
    ];

    brews = [
      "opencode"
      "pi-coding-agent"
    ];

    taps = [

    ];

    masApps = {
      #"Bitwarden" = 1352778147;
      #"Ghostery" = 6504861501;

    };
  };
}
