{
  pkgs,
  lib,
  pkgs-unstable,
  ...
}:

with pkgs;
[
  # CLI Tools
  license-generator
  carapace
  nushell
  #####ZSH#####
  zsh
  zsh-autocomplete
  ############
  
  # Development Tools
  pkgs-unstable.helix
  gnumake
  fly
  

  # Podman and Container Tools
  buildah
  podman
  podman-compose
  skopeo

  # Databases
  sqld
  tigerbeetle

  # Other Dev Tools
  tree-sitter

]
