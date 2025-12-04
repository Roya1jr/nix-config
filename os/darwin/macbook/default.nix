{
  pkgs,
  pkgs-unstable,
  lib,
  system,
  ...
}:

{
  imports = [
    #../shared.nix
  ];
  environment.systemPackages = [
    pkgs.home-manager
  ];

  system = {
    stateVersion = 6;
    primaryUser = "prince";
  };

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [
        "nix-command"
        "flakes"
      ];
    };
  };
  home-manager.users.prince =
    { config, ... }:
    {
      imports = [
        (import ../../../home-manager/macos.nix {
          inherit
            pkgs
            pkgs-unstable
            lib
            system
            ;
        })
      ];

      ### Installed Settings####
      programs = {
        git = {
         enable = true;          
         settings = {
            user = {
              name = "Prince Junior Mguni";
              email = "prince.mguni@outlook.com";
            };
            init = {
              defaultBranch = "main";
            };
            safe = {
              directory = "/etc/nixos";
            };
            pull.rebase = true;
          };
        };
      };
      ################
    };

  programs = {
    zsh.enable = true;
  };

  services = {

  };

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
      "audacity"
      "arduino-ide"
      "android-studio"
      "blender@lts"
      "dbeaver-community"
      "devtoys"
      "diffusionbee"
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

  system = {
    defaults = {
      # dock = {
      #   autohide = true;
      #   orientation = "bottom";
      #   show-process-indicators = true;
      #   show-recents = false;
      #   static-only = true;
      # };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = true;
        ShowPathbar = true;
      };
      # NSGlobalDomain = {
      #   AppleKeyboardUIMode = 3;
      #   "com.apple.keyboard.fnState" = true;
      #   NSAutomaticWindowAnimationsEnabled = false;
      # };
    };
    keyboard = {
      enableKeyMapping = true;
    };
  };
}
