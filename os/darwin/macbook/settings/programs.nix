{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    };
  };

  ##########Environment###############
  environment.systemPackages = [
    pkgs.home-manager
  ];
  ####################################
}
