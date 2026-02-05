{
  pkgs,
  pkgs-unstable,
  lib,
  system,
  ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "i915.enable_guc=3" ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver     # VA-API (iHD) userspace
      vpl-gpu-rt             # oneVPL (QSV) runtime
      intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
    ];
  };
  hardware.enableRedistributableFirmware = true;


  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };

  services.printing.enable = true;
  virtualisation.libvirtd.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
        {
          from = 8091;
          to = 8096;
        } # KDE Connect
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
        {
          from = 8091;
          to = 8096;
        }
      ];
    };
  };
  ##Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.xpadneo.enable = true;
  ##Bluetooth

  programs.openvpn3.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
  ];

  ##Flatpak Desktop Only##
  services.flatpak = {
    update = {
      onActivation = true;
    };
    enable = true;
    packages = [
      "com.calibre_ebook.calibre"
      "io.github.RodZill4.Material-Maker"
      "md.obsidian.Obsidian"
      "com.heroicgameslauncher.hgl"
      "org.jdownloader.JDownloader"
      "eu.jumplink.Learn6502"
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
      "org.gnome.Solanum"
      "net.waterfox.waterfox"
      "app.zen_browser.zen"
      "net.pixieditor.PixiEditor"
    ];

  };

  home-manager.users.prince =
    {
      config,
      ...
    }:
    {
      imports = [
        (import ../../../home-manager/desktop.nix {
          inherit
            pkgs
            pkgs-unstable
            lib
            system
            ;
        })
      ];
    };

}
