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
  };
}
