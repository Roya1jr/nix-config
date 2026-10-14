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

    ######################### Extras ###########################
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    bqn-lsp = {
      url = "sourcehut:~detegr/bqnlsp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    monaspace-script = {
      url = "github:Roya1jr/monaspace-scripted";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ######################### Extras ###########################
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nixos-wsl,
      nix-flatpak,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;

      user = "prince";
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = lib.genAttrs systems;

      ######################### Package sets ###########################
      customPackagesOverlay = import ./overlays/packages.nix inputs;
      systemOverridesList = import ./overlays/overrides.nix inputs;

      # Darwin-only: stub out inetutils
      darwinOverlay = final: prev: {
        inetutils = prev.runCommand "stub-inetutils" { } "mkdir -p $out/bin";
      };

      mkPkgs =
        nixpkgsSource: system:
        import nixpkgsSource {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            customPackagesOverlay
          ]
          ++ systemOverridesList
          ++ lib.optional (lib.hasSuffix "-darwin" system) darwinOverlay;
        };

      pkgsFor = forAllSystems (mkPkgs nixpkgs);
      pkgsStableFor = forAllSystems (mkPkgs nixpkgs-stable);

      ######################### Shared module pieces ###########################
      # One place for everything NixOS and nix-darwin have in common.
      mkSpecialArgs = system: {
        inherit inputs user;
        pkgs-stable = pkgsStableFor.${system};
      };

      mkCommonModule = system: {
        nixpkgs.pkgs = pkgsFor.${system};
        nix.settings.trusted-users = [ user ];
        home-manager = {
          users.${user} = import ./home-manager;
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            flake-inputs = inputs;
            pkgs-stable = pkgsStableFor.${system};
            inherit system;
          };
        };
      };

      ######################### System builders ###########################
      mkNixos =
        {
          system ? "x86_64-linux",
          modules,
        }:
        lib.nixosSystem {
          specialArgs = mkSpecialArgs system;
          modules = modules ++ [
            nixpkgs.nixosModules.readOnlyPkgs
            nix-flatpak.nixosModules.nix-flatpak
            home-manager.nixosModules.home-manager
            (mkCommonModule system)
          ];
        };

      mkDarwin =
        {
          system ? "aarch64-darwin",
          modules,
        }:
        darwin.lib.darwinSystem {
          specialArgs = mkSpecialArgs system;
          modules = modules ++ [
            home-manager.darwinModules.home-manager
            (mkCommonModule system)
            { users.users.${user}.home = "/Users/${user}"; }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkNixos {
          modules = [ ./os/linux/desktop ];
        };
        wsl = mkNixos {
          modules = [
            ./os/linux/wsl
            nixos-wsl.nixosModules.default
          ];
        };
      };

      darwinConfigurations = {
        macbook = mkDarwin {
          modules = [ ./os/darwin/macbook ];
        };
      };

      formatter = forAllSystems (system: pkgsFor.${system}.nixfmt);
    };
}
