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
    taps = [
      "desert-ant-labs/tap"
    ];


    casks = [
      ########GUI#########
      "anydesk"
      "audacity"
      "anytype"
      "arduino-ide"
      "birdfont"
      "blender@lts"
      "bruno"
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
      {
         name = "desert-ant-labs/tap/desertant";
         trusted = true;
       }
      "odin"
      "ollama"
      "pi-coding-agent"
    ];


    masApps = {
      #"Bitwarden" = 1352778147;
      #"Ghostery" = 6504861501;

    };
  };
}
