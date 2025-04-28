{
  pkgs,
  pkgs-unstable,
  ...
}:

with pkgs;
[
  erlang_26
  gleam
  ghc

  ##GOLANG##
  air
  delve
  go
  golangci-lint
  golangci-lint-langserver
  gopls
  gotools
  pkgs-unstable.templ
  pkgs-unstable.pkgsite
  #########

  ##Janet
  janet
  jpm
  ##Janet

  jelly

  ##JS
  biome
  pkgs-unstable.bun
  emmet-language-server
  nodejs_22
  nodePackages.typescript-language-server
  typescript
  vscode-langservers-extracted
  ##JS

  ##Lua
  lua
  luarocks
  lua-language-server
  ##Lua

  #######LSP##########
  dockerfile-language-server-nodejs
  taplo
  marksman
  ####################

  ##Ocaml
  ocaml
  opam
  ##Ocaml

  php
  protobuf_25

  ##Python
  python311
  python311Packages.pip
  ruff-lsp
  python311Packages.python-lsp-server
  python311Packages.ipykernel
  ##Python

  ##Nix
  nil
  nixfmt-rfc-style
  ##Nix

  ##Rust
  rustup
  ##Rust

  ##Tailwind
  pkgs-unstable.tailwindcss_4
  pkgs-unstable.tailwindcss-language-server
  ##Tailwind

  wasmtime
  wasmer
  pkgs-unstable.uiua
  yaml-language-server
  zulu

  ##Zig
  zig
  zls
  ##Zig
]
