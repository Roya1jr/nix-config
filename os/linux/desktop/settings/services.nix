{
  ...
}:

{
  services = {
    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
    };
    blueman = {
      enable = true;
    };
    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
      xkb = {
        layout = "za";
        variant = "";
      };
    };
    fail2ban.enable = true;
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no";
      };
    };
    printing = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    #3rd Party
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "prince";
    };
    audiobookshelf = {
      enable = true;
      openFirewall = true;
      user = "prince";
      host = "0.0.0.0";
    };
    kavita = {
      enable = true;
      tokenKeyFile = "/var/lib/kavita/token.key";
    };

  };

}
