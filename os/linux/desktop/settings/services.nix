{ pkgs, ... }:

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
      package = pkgs.jellyfin;
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
    sunshine = {
      package = pkgs.sunshine;
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
    calibre-web = {
      enable = true;

      listen = {
        ip = "0.0.0.0";
      };

      openFirewall = true;

      options = {
        # Path to the directory containing metadata.db
        calibreLibrary = "/mnt/Storage/Books";

        enableBookUploading = true;
        enableBookConversion = true;
      };
    };

    bookorbit = {
      enable = true;
      openFirewall = true;

      environment = {
        # Must match the address you actually type in the browser / devices
        APP_URL = "http://http://192.168.1.182"; # your server's LAN IP or hostname
        PORT = 8200;
      };

      environmentFile = "/etc/bookorbit/secrets.env";
    };

  };

}
