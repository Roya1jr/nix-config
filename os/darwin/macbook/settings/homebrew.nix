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
      "audacity"
      "anytype"
      "audacity"
      "arduino-ide"
      "birdfont"
      "blender@lts"
      "bruno"
      "dbeaver-community"
      "devtoys"
      "google-chrome"
      "godot"
      "jdownloader"
      "keepingyouawake"
      "knockknock"
      "lm-studio"
      "material-maker"
      "mochi"
      "obsidian"
      "pixieditor"
      "raycast"
      "rio"
      "sonic-pi"
      "super-productivity"
      "tablecruncher"
      "utm"
      "wezterm"
      "zen"
      "zed"
      ####################
    ];

    brews = [
      "block-goose-cli"
      "container"
      "container-compose"
      "odin"
      "ollama"
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
