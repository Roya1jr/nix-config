{ pkgs, system, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ../../shared.nix
  ];
  wsl.enable = true;
  wsl.defaultUser = "prince";
  wsl.extraBin = with pkgs; [
    { src = "${coreutils}/bin/uname"; }
  ];

}
