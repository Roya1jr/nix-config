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
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "prince";
    };
  };

}
