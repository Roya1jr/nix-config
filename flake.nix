{
  description = "Prince nix config v2";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    #########################Extras###########################
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    bqn-lsp = {
      url = "sourcehut:~detegr/bqnlsp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix/master";
    #########################Extras###########################
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
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
      customPackagesOverlay = import ./overlays/packages.nix inputs;
      systemOverridesList = import ./overlays/overrides.nix inputs;
      mkPkgs =
        nixpkgsSource: system:
        import nixpkgsSource {
          inherit system;
          config.allowUnfree = true;
          overlays = [ customPackagesOverlay ] ++ systemOverridesList;
        };
      pkgsFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs system);
      pkgsStableFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs-stable system);

      # helper for NixOS system, uses the 'user' variable from the let-binding
      nixosSystemForUser =
        {
          arch ? "x86_64-linux",
          entrypoint,
        }:

        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };
          modules = [
            entrypoint
            inputs.nixpkgs.nixosModules.readOnlyPkgs
            {
              nixpkgs.pkgs = pkgsFor.${arch};
              _module.args = {
                inherit inputs user;
                pkgs-stable = pkgsStableFor.${arch};
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
                  pkgs-stable = pkgsStableFor.${arch};
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
          specialArgs = { inherit inputs user; };
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
                pkgs-stable = pkgsStableFor.${arch};
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
                  pkgs-stable = pkgsStableFor.${arch};
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
