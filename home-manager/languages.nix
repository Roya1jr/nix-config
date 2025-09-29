{
  pkgs,
  pkgs-unstable,
  system,
  lib,
  ...
}:

with pkgs;
(
  let
    isLinux = builtins.elem system [
      "x86_64-linux"
      "aarch64-linux"
    ];
    common = [
      ##C++##
      _4th
      cmake
      lldb
      raylib
      #######

      erlang_26
      gleam
      ghc
      pkgs-unstable.decker

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
      ##########

      ##Janet##
      janet
      jpm
      #########

      jelly

      ##JS##
      pkgs-unstable.biome
      pkgs-unstable.bun
      pkgs-unstable.pnpm
      pkgs-unstable.emmet-language-server
      nodejs_24
      pkgs-unstable.typescript-language-server
      pkgs-unstable.typescript
      pkgs-unstable.vscode-langservers-extracted
      ######

      pkgs-unstable.literate

      ##Lua##
      lua
      luarocks
      lua-language-server
      #######

      ##LSP##
      pkgs-unstable.docker-language-server
      pkgs-unstable.yaml-language-server
      taplo
      marksman
      #######

      ##Ocaml##
      ocaml
      opam
      #########

      php
      pkgs-unstable.pkl
      protobuf

      ##Python##
      python313
      uv
      pyright
      ruff
      ##########

      mercury

      ##Nix##
      nil
      nixfmt-rfc-style
      #######

      rakudo

      ##Rust##
      rustup
      ##Rust##

      ##Lisp##
      sbcl
      ########

      ##Tailwind##
      pkgs-unstable.tailwindcss_4
      pkgs-unstable.tailwindcss-language-server
      ############

      ##Uiua##
      (pkgs-unstable.uiua.override {
        windowSupport = true;
        audioSupport = true;
        webcamSupport = true;
      })
      ########

      unison-ucm

      ##Wasm##
      pkgs-unstable.wasmtime
      #pkgs-unstable.wasmer
      ########

      ##Zig##
      pkgs-unstable.zig
      pkgs-unstable.zls
      ##Zig##

      zulu

    ];
    linuxOnly = [
      ##C++##
      glibc
      gfortran14
      libclang
      xorg.libX11
      ######

      pkgs-unstable.factor-lang
      hare
      (lib.hiPrio pkgs-unstable.j)

      ##Broken##
      #io
      #qnial
      #########

      racket
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
