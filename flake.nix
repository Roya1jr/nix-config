{
  description = "Prince nix config v2";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
      nixos-hardware,
      nix-flatpak,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
      pkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );

      darwinSystem =
        {
          user,
          arch ? "aarch64-darwin",
        }:
        entrypoint:
        darwin.lib.darwinSystem {
          system = arch;
          specialArgs = {
            pkgs = pkgsFor.${arch};

            inherit inputs;
          };

          modules = [
            entrypoint
            home-manager.darwinModules.home-manager
            {
              _module.args = {
                inherit inputs;
              };
              home-manager = {
                users.${user} = import ./home-manager;
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  flake-inputs = inputs;
                  pkgs-unstable = import nixpkgs-unstable {
                    system = arch;
                    config.allowUnfree = true;
                  };
                };
              };
              users.users.${user}.home = "/Users/${user}";
              nix.settings.trusted-users = [ user ];
            }
          ];
        };

      nixosSystem =
        {
          user,
          arch ? "x86_64-linux",
        }:
        entrypoint:
        nixpkgs.lib.nixosSystem {
          system = arch;
          specialArgs = {
            pkgs = pkgsFor.${arch};

            inherit inputs;
          };
          modules = [
            entrypoint
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                users.${user} = import ./home-manager;
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  flake-inputs = inputs;
                  pkgs-unstable = import nixpkgs-unstable {
                    system = arch;
                    config.allowUnfree = true;
                  };
                };
              };
              nix.settings.trusted-users = [ user ];
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = nixosSystem {
          user = "prince";
          arch = "x86_64-linux";
        } ./os/linux/desktop;

        wsl = nixosSystem {
          user = "prince";
          arch = "x86_64-linux";
        } ./os/linux/wsl;
      };

      darwinConfigurations = {
        macbook = darwinSystem {
          user = "prince";
          arch = "aarch64-darwin";
        } ./os/darwin/macbook;
      };
    };
}
