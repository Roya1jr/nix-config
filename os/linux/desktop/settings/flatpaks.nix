{ ... }:
{
  services = {
    flatpak = {
      update = {
        onActivation = true;
      };
      enable = true;
      packages = [
        "io.anytype.anytype"
        "org.blender.Blender"
        "com.usebottles.bottles"
        "com.calibre_ebook.calibre"
        "page.kramo.Cartridges"
        "io.github.thetumultuousunicornofdarkness.cpu-x"
        "com.tomjwatson.Emote"
        "io.github.Faugus.faugus-launcher"
        "com.github.tchx84.Flatseal"
        "org.godotengine.Godot"
        "com.heroicgameslauncher.hgl"
        "org.jdownloader.JDownloader"
        "eu.jumplink.Learn6502"
        "org.libreoffice.LibreOffice"
        "io.github.RodZill4.Material-Maker"
        "io.mpv.Mpv"
        "md.obsidian.Obsidian"
        "org.musicbrainz.Picard"
        "net.pixieditor.PixiEditor"
        "net.nokyan.Resources"
        "com.obsproject.Studio"
        "net.waterfox.waterfox"
        "app.zen_browser.zen"
      ];
    };
  };
}
