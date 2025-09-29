{ pkgs, user, packages, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  # Assign system and home packages
  environment.systemPackages = packages.systemPackages;
  services.flatpak.enable = true;
  services.flatpak.packages = packages.flatpakPackages;

  home-manager.users.${user} = {
    home.packages = packages.homePackages;
  };

  # Programs
  programs = {
    kdeconnect.enable = true;

    steam.enable = true;
    steam.remotePlay.openFirewall = true;
    steam.dedicatedServer.openFirewall = true;

    zsh.enableCompletion = false;

    git.enable = true;
    git.userName = "Prince";
    git.userEmail = "prince@email.com";
    git.ignores = [ "*node_modules" ];
    git.extraConfig.init.defaultBranch = "main";
    git.extraConfig.safe.directory = "/etc/nixos";
    git.extraConfig.pull.rebase = true;
  };

  # Desktop services
  services.jellyfin.enable = true;
  services.jellyfin.openFirewall = true;
  services.jellyfin.user = user;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb.layout = "za";
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  # Multimedia
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;

  # Firewall
  networking = {
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
        { from = 8091; to = 8096; } # KDE Connect
      ];
      allowedUDPPortRanges = [
        { from = 1714; to = 1764; } # KDE Connect
        { from = 8091; to = 8096; }
      ];
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.xpadneo.enable = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Misc
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  security.rtkit.enable = true;
  printing.enable = true;

  system.stateVersion = "24.11";
}
