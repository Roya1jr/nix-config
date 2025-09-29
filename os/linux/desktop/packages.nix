{ pkgs, pkgs-unstable, ... }:

let
  # System-wide packages
  systemPackages = with pkgs; [
    home-manager
    kdePackages.partitionmanager
  ];

  # Home Manager packages
  homePackages = with pkgs; [
    dyalog.override { acceptLicense = true; }
    lmstudio
    hyprland
    wezterm
    ride
    pkgs-unstable.vscode
  ];

  # Flatpak apps
  flatpakPackages = [
    "com.calibre_ebook.calibre"
    "io.github.RodZill4.Material-Maker"
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
    "org.gnome.Solanum"
    "app.zen_browser.zen"
  ];
in
{
  systemPackages = systemPackages;
  homePackages = homePackages;
  flatpakPackages = flatpakPackages;
}
