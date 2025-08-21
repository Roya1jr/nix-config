{
  pkgs,
  pkgs-unstable,
  ...
}:

with pkgs;
[
  ####C++###
  _4th
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
  pkgs-unstable.biome
  pkgs-unstable.bun
  pkgs-unstable.pnpm
  pkgs-unstable.emmet-language-server
  nodejs_24
  pkgs-unstable.typescript-language-server
  pkgs-unstable.typescript
  pkgs-unstable.vscode-langservers-extracted
  ##JS

  pkgs-unstable.literate

  ##Lua
  lua
  luarocks
  lua-language-server
  ##Lua

  #######LSP##########
  pkgs-unstable.docker-language-server
  pkgs-unstable.yaml-language-server
  taplo
  marksman
  ####################

  ##Ocaml
  ocaml
  opam
  ##Ocaml

  php
  pkgs-unstable.pkl
  protobuf

  ##Python
  python313
  uv
  pyright
  ruff
  ##Python

  mercury

  ##Nix
  nil
  nixfmt-rfc-style
  ##Nix

  rakudo

  ##Rust
  rustup
  ##Rust

  ##lisp
  sbcl
  ##lisp

  ##Tailwind
  pkgs-unstable.tailwindcss_4
  pkgs-unstable.tailwindcss-language-server
  ##Tailwind

  (pkgs-unstable.uiua.override {
    windowSupport = true;
    audioSupport = true;
    webcamSupport = true;
  })
  unison-ucm

  pkgs-unstable.wasmtime
  pkgs-unstable.wasmer

  ##Zig
  pkgs-unstable.zig
  pkgs-unstable.zls
  ##Zig

  zulu

]
