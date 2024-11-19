{ pkgs, ... }:

{
  imports = [
    #../shared.nix
  ];
  environment.systemPackages =
    [
      pkgs.home-manager
    ];

  system.stateVersion = 5;

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };
  home-manager.users.prince =
    { ... }:
    {
      home = {
        packages = with pkgs;[


        ];
      file = {
      "/Users/prince/Library/Application Support/nushell/config.nu".source = ../../../dotfiles/nushell/config.nu;
      "/Users/prince/Library/Application Support/nushell/env.nu".source = ../../../dotfiles/nushell/env.nu;
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
    nix-daemon.enable = true;
  };

  homebrew = {
    enable = true;

    casks = [
      "android-studio"
      "blender@lts"
      "dbeaver-community"
      "devtoys"
      "discord"
      "firefox"
      "flutter"
      "google-chrome"
      "godot"
      "heroic"
      "material-maker"
      "microsoft-teams"
      "obsidian"
      "steam"
      "wezterm"
      "visual-studio-code"
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
        FXEnableExtensionChangeWarning = false;
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
