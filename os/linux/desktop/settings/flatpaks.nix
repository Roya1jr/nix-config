{ ... }:
{
  services = {
    flatpak = {
      update = {
        onActivation = true;
      };
      enable = true;
      packages = [
        "com.calibre_ebook.calibre"
        "io.anytype.anytype"
        "io.github.RodZill4.Material-Maker"
        "md.obsidian.Obsidian"
        "com.heroicgameslauncher.hgl"
        "org.jdownloader.JDownloader"
        "eu.jumplink.Learn6502"
        "org.blender.Blender"
        "io.github.thetumultuousunicornofdarkness.cpu-x"
        "com.microsoft.Edge"
        "org.musicbrainz.Picard"
        "org.libreoffice.LibreOffice"
        "com.usebottles.bottles"
        "com.tomjwatson.Emote"
        "com.github.tchx84.Flatseal"
        "com.obsproject.Studio"
        "net.nokyan.Resources"
        "io.mpv.Mpv"
        "io.github.Faugus.faugus-launcher"
        "org.godotengine.Godot"
        "net.waterfox.waterfox"
        "app.zen_browser.zen"
        "net.pixieditor.PixiEditor"
      ];
    };
  };
}
