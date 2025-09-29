{
  description = "Prince nix config v2";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-wsl, nixos-hardware, nix-flatpak, darwin, home-manager, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      mkPkgs = nixpkgsSource: system:
        import nixpkgsSource { inherit system; config.allowUnfree = true; };

      pkgsFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs system);
      pkgsUnstableFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs-unstable system);

      nixosSystemForUser = { user ? "prince"; arch ? "x86_64-linux"; entrypoint }: 
        nixpkgs.lib.nixosSystem {
          modules = [
            entrypoint
            inputs.nixpkgs.nixosModules.readOnlyPkgs
            {
              nixpkgs.pkgs = pkgsFor.${arch};
              _module.args = { inherit inputs; };
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
                };
              };
              nix.settings.trusted-users = [ user ];
            }
          ];
        };

      darwinSystemForUser = { user ? "prince"; arch ? "aarch64-darwin"; entrypoint }: 
        darwin.lib.darwinSystem {
          modules = [
            entrypoint
            {
              nixpkgs.pkgs = pkgsFor.${arch};
              _module.args = { inherit inputs; };
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
          entrypoint = ./os/linux/wsl;
        };
      };

      darwinConfigurations = {
        macbook = darwinSystemForUser {
          entrypoint = ./os/darwin/macbook;
        };
      };
    };
}
