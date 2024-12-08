{ pkgs, unstable, inputs, lib, ... }:
{
  services.printing.enable = true;
  services.openssh.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.containers.enable = true;
  users = {
    mutableUsers = true;
    users = {
      prince = {
        shell = pkgs.fish;
        description = "Me";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };

  programs = {
    fish = {
      enable = true;
    };
    nix-ld.enable = true;
  };
  home-manager.users.prince =
    { system, ... }:
    {
      home = {
        packages = with pkgs;[
          #######CLI##########
          fontfor
          traceroute
          ######################

          #######Programming#########

          ##C++#
          (lib.hiPrio libclang)
          xorg.libX11
          ######

          factor-lang
          hare
          io
          (lib.hiPrio j)

          mercury

          qnial
          racket
          rakudo
          ngn-k
          wasmtime
          uiua
          unison-ucm
          zulu
          ####################
        ];
      };

      home.sessionVariables = {
        EDITOR = "hx";
        SHELL = "fish";
      };
    };

}
