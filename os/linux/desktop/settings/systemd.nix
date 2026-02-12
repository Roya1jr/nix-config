{ ... }:
{
  systemd = {
    services = {
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
