{
  pkgs,
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
      llvmPackages_21.lldb
      raylib
      #######

      ##BQN##
      cbqn-replxx
      bqnlsp
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
      air
      delve
      golangci-lint
      golangci-lint-langserver
      gopls
      gotools
      templ
      pkgsite
      ##########

      ##Janet##
      janet
      jpm
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
      jelly
      #########

      ##JS##
      nodejs_24
      biome
      bun
      pnpm
      emmet-language-server
      typescript-language-server
      typescript
      vscode-langservers-extracted
      ######

      literate

      ##Lua##
      luajit
      luarocks
      lua-language-server
      #######

      ##LSP##
      docker-language-server
      yaml-language-server
      taplo
      markdown-oxide
      #######

      ##Ocaml##
      ocaml
      opam
      #########

      php85
      pkl
      protobuf

      ##Python##
      python314
      uv
      pyright
      ruff
      ##########

      mercury

      ##Nix##
      nil
      nixfmt
      nixd
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
      tailwindcss_4
      tailwindcss-language-server
      ############

      ##Typst#####
      tinymist
      typst
      ###########

      ##Uiua##
      (uiua.override {
        windowSupport = true;
        audioSupport = true;
        webcamSupport = true;
      })
      ########

      ##Wasm##
      wasmtime
      ########

      ###Zig##
      zig_0_16
      zls
      #######

      zulu25

    ];
    linuxOnly = [
      ##C++##
      llvmPackages_21.clang
      llvmPackages_21.clang-tools
      ######
      ###Fortran###
      llvmPackages_21.flang
      #############

      factor-lang
      hare
      odin
      ols
    ];
  in
  common ++ lib.optionals isLinux linuxOnly
)
