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
      #_4th
      cmake
      lldb
      raylib
      #######

      ##BQN##
      pkgs.cbqn-replxx
      pkgs.bqnlsp
      #######

      pkgs-unstable.erlang_28
      
      pkgs-unstable.haskell.compiler.ghc914

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

      ####J#####
      (lib.hiPrio pkgs-unstable.j)
      ##########

      ##Janet##
      pkgs-unstable.janet
      pkgs-unstable.jpm
      #########

      #jelly

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
      pkgs-unstable.lua54Packages.lua
      pkgs-unstable.luarocks
      pkgs-unstable.lua-language-server
      pkgs-unstable.luajit
      #######

      ##LSP##
      pkgs-unstable.docker-language-server
      pkgs-unstable.yaml-language-server
      taplo
      markdown-oxide
      #######

      ##Ocaml##
      ocaml
      opam
      #########

      ##Odin##
      odin
      ols
      ########

      pkgs-unstable.php85
      pkgs-unstable.pkl
      pkgs-unstable.protobuf

      ##Python##
      pkgs-unstable.python314
      uv
      pyright
      ruff
      ##########

      mercury

      ##Nix##
      nil
      nixfmt-rfc-style
      nixd
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
      #######

      pkgs-unstable.zulu25
      pkgs-unstable.racket

    ];
    linuxOnly = [
      ##C++##
      glibc
      gfortran14
      llvmPackages_22.clang-unwrapped
      xorg.libX11
      ######

      pkgs-unstable.factor-lang
      pkgs-unstable.hare
      
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
