{
  pkgs,
  ...
}:
{
  services.printing.enable = true;
  services.openssh.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  virtualisation.containers.enable = true;
  users = {
    mutableUsers = true;
    users = {
      prince = {
        shell = pkgs.zsh;
        description = "Me";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "dialout"
          "video"
          "render"
        ];
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      autosuggestions.enable = false;
      syntaxHighlighting.enable = false;

    };
    nix-ld.enable = true;
  };

}
