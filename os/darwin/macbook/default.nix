{
  ...
}:

{
  imports = [
    ../shared.nix
    ./settings/homebrew.nix
    ./settings/programs.nix
    ./settings/services.nix
    ./settings/system.nix
  ];

  system = {
    stateVersion = 6;
    primaryUser = "prince";
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

  home-manager.users.prince =
    { ... }:
    {

      ### Installed Settings####
      programs = { };
      ################
    };

}
