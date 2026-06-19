{
  pkgs,
  pkgs-unstable,
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
      enable32Bit = true;
      package = pkgs-unstable.mesa;
      extraPackages = with pkgs-unstable; [
        intel-media-driver # VA-API (iHD) userspace
        vpl-gpu-rt # oneVPL (QSV) runtime
        intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe
      ];
      extraPackages32 = with pkgs-unstable.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
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
          from = 9999;
          to = 9999;
        }
        {
          from = 5000;
          to = 5000;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 9999;
          to = 9999;
        }
      ];
    };
  };
  ########################################

}
