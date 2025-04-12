{ pkgs,... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };
  services.flatpak.enable = true;
  services.printing.enable = true;
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
  environment.systemPackages = with pkgs; [
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
    "com.microsoft.Edge"
    "org.musicbrainz.Picard"
    "com.usebottles.bottles"
    "com.tomjwatson.Emote"
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "com.obsproject.Studio"
    "net.nokyan.Resources"
    "io.mpv.Mpv"
    "net.retrodeck.retrodeck"
    "org.gnucash.GnuCash"
    "org.godotengine.Godot"
    "org.gnome.Solanum
"  ];

  home-manager.users.prince =
    { system,pkgs-unstable, ... }:
    {
      home = {
        packages = with pkgs;[
          #######Programming##########
          (dyalog.override { acceptLicense = true; })
          lmstudio
          #######Programming##########

          ###GUI### 
          hyprland
          wezterm
          #########

          ##Editors##
          ride
          pkgs-unstable.vscode
          ###########

        ];
      };

    };

}
