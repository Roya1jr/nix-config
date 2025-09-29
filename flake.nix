{
  description = "Prince nix config v3";

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
  { user ? "prince" }:   
    let
      systems = [ "x86_64-linux" "aarch64-darwin" ];

      # helper: import nixpkgs with allowUnfree
      mkPkgs = nixpkgsSource: system:
        import nixpkgsSource {
          inherit system;
          config.allowUnfree = true;
        };

      # stable + unstable package sets
      pkgsFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs system);
      pkgsUnstableFor = nixpkgs.lib.genAttrs systems (system: mkPkgs nixpkgs-unstable system);

      darwinSystem = { arch ? "aarch64-darwin" }: entrypoint:
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

      nixosSystem = { arch ? "x86_64-linux" }: entrypoint:
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
    in {
      nixosConfigurations = {
        desktop = nixosSystem { arch = "x86_64-linux"; } ./os/linux/desktop;
        wsl     = nixosSystem { arch = "x86_64-linux"; } ./os/linux/wsl;
      };

      darwinConfigurations = {
        macbook = darwinSystem { arch = "aarch64-darwin"; } ./os/darwin/macbook;
      };
    };
}

