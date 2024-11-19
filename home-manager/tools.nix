{ pkgs, lib, ... }:

with pkgs; [
  # CLI Tools
  license-generator
  carapace
  nushell

  # Development Tools
  helix
  gnumake
  fly

  # Podman and Container Tools
  buildah
  podman
  podman-compose
  skopeo

  # Other Dev Tools
  tree-sitter
]
