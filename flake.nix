{
  description = "Prince nix config v2";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    #########################Extras###########################
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";
    bqn-lsp = {
      url = "sourcehut:~detegr/bqnlsp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #########################Extras###########################
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
      nixos-hardware,
      nix-flatpak,
      bqn-lsp,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      user = "prince";
      externalOverlay = import ./overlays/pkgs.nix inputs;
      mkPkgs =
        nixpkgsSource: system:
        import nixpkgsSource {
          inherit system;
          config.allowUnfree = true;
          overlays = [ externalOverlay ];
        };
      pkgsFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs system);
      pkgsUnstableFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs-unstable system);

      # helper for NixOS system, uses the 'user' variable from the let-binding
      nixosSystemForUser =
        {
          arch ? "x86_64-linux",
          entrypoint,
        }:

        nixpkgs.lib.nixosSystem {
          modules = [
            entrypoint
            inputs.nixpkgs.nixosModules.readOnlyPkgs
            {
              nixpkgs.pkgs = pkgsFor.${arch};
              _module.args = {
                inherit inputs user;
                pkgs-unstable = pkgsUnstableFor.${arch};
              };
            }
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                users.${user} = import ./home-manager;
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  flake-inputs = inputs;
                  pkgs-unstable = pkgsUnstableFor.${arch};
                  system = arch;
                };
              };
              nix.settings.trusted-users = [ user ];
            }
          ];
        };

      darwinSystemForUser =
        {
          arch ? "aarch64-darwin",
          entrypoint,
        }:

        darwin.lib.darwinSystem {
          modules = [
            entrypoint
            {
              nixpkgs.overlays = [
                (final: prev: {
                  inetutils = prev.runCommand "stub-inetutils" { } "mkdir -p $out/bin";
                })
              ];
              nixpkgs.pkgs = pkgsFor.${arch};
              _module.args = {
                inherit inputs user;
                pkgs-unstable = pkgsUnstableFor.${arch};
              };
            }
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.${user} = import ./home-manager;
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  flake-inputs = inputs;
                  pkgs-unstable = pkgsUnstableFor.${arch};
                  system = arch;
                };
              };
              users.users.${user}.home = "/Users/${user}";
              nix.settings.trusted-users = [ user ];
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = nixosSystemForUser {
          entrypoint = ./os/linux/desktop;
        };
        wsl = nixosSystemForUser {
          # We wrap the entrypoint in an inline module to include the WSL module
          entrypoint = {
            imports = [
              ./os/linux/wsl
              nixos-wsl.nixosModules.default
            ];
          };
        };
      };

      darwinConfigurations = {
        macbook = darwinSystemForUser {
          entrypoint = ./os/darwin/macbook;
        };
      };
    };
}
