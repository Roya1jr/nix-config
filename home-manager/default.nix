{
  pkgs,
  pkgs-unstable,
  lib,
  system,
  ...
}:

let
  basePackages = import ./base.nix {
    inherit
      pkgs
      pkgs-unstable
      lib
      system
      ;
  };
  devTools = import ./tools.nix { inherit pkgs lib pkgs-unstable; };
  languages = import ./languages.nix { inherit pkgs pkgs-unstable; };
  fonts = import ./fonts.nix { inherit pkgs pkgs-unstable; };
in
{
  home = {
    stateVersion = "25.05";
    packages = basePackages ++ devTools ++ languages ++ fonts;
    file = {
      ".config/fish/config.fish".source = ../dotfiles/fish/config.fish;
      ".config/starship.toml".source = ../dotfiles/starship.toml;
      ".config/helix/languages.toml".source = ../dotfiles/helix/languages.toml;
      ".config/helix/config.toml".source = ../dotfiles/helix/config.toml;
      ".config/wezterm/wezterm.lua".source = ../dotfiles/wezterm/wezterm.lua;
    };
  };
}
