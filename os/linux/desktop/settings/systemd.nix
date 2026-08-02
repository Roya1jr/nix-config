{ ... }:
{
  systemd = {
    services = {
      calibre-web.serviceConfig = {
          ReadWritePaths = [ "/mnt/Storage/Books" ];
          UMask = "0002";
        };
      flatpak-managed-install = {
        serviceConfig = {
          Restart = "on-failure";
        };
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
      };
    };
  };
}
