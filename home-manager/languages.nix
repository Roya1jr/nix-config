{
  pkgs,
  pkgs-unstable,
  ...
}:

with pkgs;
[
  ####C++###
  gforth
  cmake
  lldb
  raylib
  ##########

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
  pkgs-unstable.emmet-language-server
  nodejs_24
  pkgs-unstable.typescript-language-server
  pkgs-unstable.typescript
  pkgs-unstable.vscode-langservers-extracted
  ##JS

  ##Lua
  lua
  luarocks
  lua-language-server
  ##Lua

  #######LSP##########
  pkgs-unstable.docker-language-server
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
  ruff
  python311Packages.python-lsp-server
  python311Packages.ipykernel
  ##Python

  rakudo

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

  pkgs-unstable.wasmtime
  pkgs-unstable.wasmer
  pkgs-unstable.uiua
  pkgs-unstable.yaml-language-server
  zulu

  ##Zig
  pkgs-unstable.zig
  pkgs-unstable.zls
  ##Zig
]
