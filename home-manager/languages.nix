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
  pkgs-unstable.air
  pkgs-unstable.delve
  pkgs-unstable.go
  pkgs-unstable.golangci-lint
  pkgs-unstable.golangci-lint-langserver
  pkgs-unstable.gopls
  pkgs-unstable.gotools
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
  typescript-language-server
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
