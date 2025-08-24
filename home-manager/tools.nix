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
  fish
  rlwrap
  tree
  pkgs-unstable.devenv

  #####ZSH#####
  zsh
  zsh-autocomplete
  ############

  ## Desktop Tools
  pkgs-unstable.libation
  ##

  # Development Tools
  pkgs-unstable.helix
  gnumake
  fly
  git-filter-repo

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
