{ pkgs
, inputs
, lib
, ...
}:

let
  basePackages = import ./base.nix { inherit pkgs; };
  devTools = import ./tools.nix { inherit pkgs lib; };
  languages = import ./languages.nix { inherit pkgs; };
  fonts = import ./fonts.nix { inherit pkgs; };
in
{
  home = {
    stateVersion = "24.05";
    packages = basePackages ++ devTools ++ languages ++ fonts;
    file = {
      ".config/nushell/config.nu".source = ../dotfiles/nushell/config.nu;
      ".config/nushell/env.nu".source = ../dotfiles/nushell/env.nu;
      ".config/fish/config.fish".source = ../dotfiles/fish/config.fish;
      ".config/starship.toml".source = ../dotfiles/starship.toml;
      ".config/helix/languages.toml".source = ../dotfiles/helix/languages.toml;
      ".config/helix/config.toml".source = ../dotfiles/helix/config.toml;
      ".config/wezterm/wezterm.lua".source = ../dotfiles/wezterm/wezterm.lua;
    };
    sessionVariables = {
      EDITOR = "hx";
    };
  };
}
