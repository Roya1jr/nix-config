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
      pkg-config
      cmake
      lldb
      raylib
      #######

      ##BQN##
      pkgs.cbqn-replxx
      pkgs.bqnlsp
      #######

      ###Erlang####
      pkgs-unstable.erlang_28
      #############
      
      ####Fourth###
      pkgs-unstable._4th
      #############

      #####Haskel##
      pkgs-unstable.haskell.compiler.ghc914
      #############
      
      ###Fortran###
      flang_22
      #############  
    
      ##GOLANG##
      pkgs-unstable.air
      pkgs-unstable.delve
      pkgs-unstable.go_1_26
      pkgs-unstable.golangci-lint
      pkgs-unstable.golangci-lint-langserver
      pkgs-unstable.gopls
      pkgs-unstable.gotools
      pkgs-unstable.templ
      pkgs-unstable.pkgsite
      ##########

      ##Janet##
      janet
      pkgs-unstable.jpm
      #########
      
      ##Jelly####
      pkgs-unstable.jelly
      #########
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
      luajit
      pkgs-unstable.luarocks
      pkgs-unstable.lua-language-server

      #######

      ##LSP##
      pkgs-unstable.docker-language-server
      pkgs-unstable.yaml-language-server
      pkgs-unstable.taplo
      pkgs-unstable.markdown-oxide
      #######

      ##Ocaml##
      ocaml
      opam
      #########

      ##Odin##
      pkgs-unstable.odin
      pkgs-unstable.ols
      ########

      pkgs-unstable.php85
      pkgs-unstable.pkl
      pkgs-unstable.protobuf

      ##Python##
      python314
      pkgs-unstable.uv
      pkgs-unstable.pyright
      pkgs-unstable.ruff
      ##########

      mercury

      ##Nix##
      pkgs-unstable.nil
      pkgs-unstable.nixfmt-rfc-style
      pkgs-unstable.nixd
      #######

      rakudo

      ##Rust##
      rustup
      ##Rust##

      ##Lisp##
      sbcl_2_4_6
      ########

      ###SQL####
      sqls
      ##########

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

      ##Wasm##
      pkgs-unstable.wasmtime
      ########

      ###Zig##
      pkgs-unstable.zig_0_16
      pkgs-unstable.zls
      #######

      pkgs-unstable.zulu25
      pkgs-unstable.racket

    ];
    linuxOnly = [
      ##C++##
      clang_21
      ######

      pkgs-unstable.factor-lang
      pkgs-unstable.hare

    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
