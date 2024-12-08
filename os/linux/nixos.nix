{ pkgs, lib, inputs, system, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };
  services.flatpak.enable = true;
  services.printing.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.libvirtd.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire =
    {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
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
  ##Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.xpadneo.enable = true;
  ##Bluetooth

  programs.dconf.enable = true;
  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
  ];

  services.flatpak.packages = [
    "com.calibre_ebook.calibre"
    "io.github.RodZill4.Material-Maker"
    "com.visualstudio.code"
    "md.obsidian.Obsidian"
    "com.heroicgameslauncher.hgl"
    "org.jdownloader.JDownloader"
    "org.blender.Blender"
    "io.github.thetumultuousunicornofdarkness.cpu-x"
    "app.drey.Damask"
    "io.github.zen_browser.zen"
    "com.microsoft.Edge"
    "com.github.taiko2k.tauonmb"
    "org.musicbrainz.Picard"
    "com.usebottles.bottles"
    "org.gnome.Decibels"
    "com.tomjwatson.Emote"
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "com.obsproject.Studio"
    "com.mattjakeman.ExtensionManager"
    "org.qbittorrent.qBittorrent"
    "net.nokyan.Resources"
    "io.mpv.Mpv"
  ];

  home-manager.users.prince =
    { system, ... }:
    {
      home = {
        packages = with pkgs;[
          #######Programming##########
          (dyalog.override { acceptLicense = true; })
          #######Programming##########

          ###GUI### 
          hyprland
          wezterm
          #########

          ##Editors##
          ride
          vscode
          zed-editor
          ###########

        ];
      };

    };

}
