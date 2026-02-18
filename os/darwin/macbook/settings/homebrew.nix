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
      "anythingllm"
      "anytype"
      "audacity"
      "arduino-ide"
      "android-studio"
      "blender@lts"
      "dbeaver-community"
      "devtoys"
      "discord"
      "fontforge-app"
      "google-chrome"
      "godot"
      "jdownloader"
      "lm-studio"
      "material-maker"
      "microsoft-teams"
      "obsidian"
      "pixieditor"
      "pocket-casts"
      "soduto"
      "tablecruncher"
      "wezterm"
      "visual-studio-code"
      "zen"
      "zed"
      ####################

      ########CLI#########
      "flutter"
      "j"
      ####################
    ];

    taps = [

    ];

    masApps = {
      #"Bitwarden" = 1352778147;
      #"Ghostery" = 6504861501;

    };
  };
}
