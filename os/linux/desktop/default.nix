{ pkgs, pkgs-unstable, user, ... }:

let
  packages = import ./packages.nix { inherit pkgs pkgs-unstable; };
in
import ./settings.nix { inherit pkgs pkgs-unstable user packages; }

