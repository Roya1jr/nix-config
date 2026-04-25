{ ... }:
{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    casks = [
      ########GUI#########
      "anytype"
      "audacity"
      "arduino-ide"
      "android-studio"
      "blender@lts"
      "dbeaver-community"
      "devtoys"
      "fontforge-app"
      "google-chrome"
      "godot"
      "jdownloader"
      "lm-studio"
      "material-maker"
      "obsidian"
      "pixieditor"
      "raycast"
      "soduto"
      "super-productivity"
      "wezterm"
      "zen"
      "zed"
      ####################

      ########CLI#########
      "flutter"
      "j"
      ####################
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
