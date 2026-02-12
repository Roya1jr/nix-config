{
  pkgs,
  ...
}:

{
  ##################Boot#################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "options bluetooth disable_ertm=1 ";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "i915.enable_guc=3" ];
  ######################################

  ########Hardware######################
  hardware = {
    bluetooth.enable = true;
    xpadneo.enable = true;
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # VA-API (iHD) userspace
        vpl-gpu-rt # oneVPL (QSV) runtime
        intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe
      ];
    };
  };
  ######################################

  ########Virtualisation#################
  virtualisation = {
    libvirtd.enable = true;
  };
  #####################################

  ############Security#################
  security = {
    rtkit.enable = true;
  };
  #####################################

  #################Networking#############
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
        {
          from = 8091;
          to = 8096;
        } # KDE Connect
        {
          from = 9999;
          to = 9999;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
        {
          from = 8091;
          to = 8096;
        }
        {
          from = 9999;
          to = 9999;
        }
      ];
    };
  };
  ########################################

}
