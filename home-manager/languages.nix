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
      cbqn-replxx
      #pkgs.bqnlsp
      #######

      ###Erlang####
      beam29Packages.erlang
      #############

      ####Fourth###
      _4th
      #############

      #####Haskel##
      haskell.compiler.ghc914
      #############

      ##GOLANG##
      go_1_27
      pkgs-unstable.air
      pkgs-unstable.delve
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

      ##J Language##
      (j.overrideAttrs (oldAttrs: {
        meta = oldAttrs.meta // {
          broken = false;
        };
        postInstall = (oldAttrs.postInstall or "") + ''
          if [ -f $out/bin/jconsole ]; then
            mv $out/bin/jconsole $out/bin/j
          fi
        '';
      }))
      ##############

      ##Jelly####
      pkgs-unstable.jelly
      #########

      ##JS##
      nodejs_24
      pkgs-unstable.biome
      pkgs-unstable.bun
      pkgs-unstable.pnpm
      pkgs-unstable.emmet-language-server
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

      php85
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
      steel
      ########

      ###SQL####
      sqls
      ##########

      ##Tailwind##
      pkgs-unstable.tailwindcss_4
      pkgs-unstable.tailwindcss-language-server
      ############

      ##Typst#####
      pkgs-unstable.tinymist
      pkgs-unstable.typst
      ###########

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
      zig_0_16
      pkgs-unstable.zls
      #######

      zulu25

    ];
    linuxOnly = [
      ##C++##
      clang_22
      (lib.lowPrio clang-tools)
      ######
      ###Fortran###
      flang_22
      #############

      pkgs-unstable.factor-lang
      pkgs-unstable.hare
      pkgs-unstable.odin
      pkgs-unstable.ols
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
