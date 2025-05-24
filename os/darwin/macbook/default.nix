{ pkgs, ... }:

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
    { ... }:
    {
      home = {
        packages = with pkgs; [
          ##C++#
          gcc14
          ######
          pocketbase

        ];
        file = {
          ".config/aerospace/aerospace.toml".source = ../../../dotfiles/aerospace/aerospace.toml;
        };

      };

      ### Installed Settings####
      programs = {
        git = {
          enable = true;
          userName = "Prince Junior Mguni";
          userEmail = "prince.mguni@outlook.com";
          extraConfig = {
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

    casks = [
      ##GUI##
      "android-studio"
      "blender@lts"
      "dbeaver-community"
      "devtoys"
      "diffusionbee"
      "discord"
      "firefox"
      "flutter"
      "fontforge"
      "google-chrome"
      "godot"
      "love"
      "material-maker"
      "microsoft-teams"
      "nikitabobko/tap/aerospace"
      "obsidian"
      "soduto"
      "wezterm"
      "visual-studio-code"
      ########
    ];

    taps = [

    ];

    masApps = {
      "Microsoft365" = 1450038993;
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
