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
      "anydesk"
      "audacity"
      "anytype"
      "audacity"
      "arduino-ide"
      "birdfont"
      "blender@lts"
      "bruno"
      "comfy"
      "dbeaver-community"
      "devtoys"
      "google-chrome"
      "godot"
      "ghostty"
      "jdownloader"
      "knockknock"
      "lm-studio"
      "material-maker"
      "mochi"
      "obsidian"
      "pixieditor"
      "raycast"
      "rio"
      "rustdesk"
      "sonic-pi"
      "super-productivity"
      "tablecruncher"
      "utm"
      "unsloth"
      "vorssaint"
      "zen"
      "zed"
      ####################
    ];

    brews = [
      "container"
      "container-compose"
      "odin"
      "localai"
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
