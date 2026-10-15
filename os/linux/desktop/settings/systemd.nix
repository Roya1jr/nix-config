{ pkgs, ... }:
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
      rustdesk-daemon = {
        description = "RustDesk Daemon for remote desktop access";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.rustdesk-flutter}/bin/rustdesk --service";
          Restart = "always";
        };
      };
    };
  };
}
