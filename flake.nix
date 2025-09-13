{
  description = "player4deads personal flake";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    legacynixpgs.url = "github:nixos/nixpkgs?ref=25.05";

    # WM
    niri.url = "github:sodiboo/niri-flake";
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gamescope = {
      url = "github:nixos/nixpkgs/4e942f9ef5b35526597c354d1ded817d1c285ef1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      legacynixpgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-stable = import legacynixpgs {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {

          specialArgs = {
            inherit inputs;
            inherit system;
            inherit pkgs-stable;
          };

          modules = [
            ./desktop/bundle.nix
            ./packages.nix
            ./core/bundle.nix

            home-manager.nixosModules.home-manager
            inputs.nvf.nixosModules.default

            inputs.stylix.nixosModules.stylix

            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.users.player4dead = ./desktop/home/bundle.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit system;
                inherit pkgs-stable;

              };
              home-manager.backupFileExtension = "backup";

              home-manager.sharedModules = [
                inputs.niri.homeModules.niri
              ];
            }
          ];
        };



        server = nixpkgs.lib.nixosSystem {

          specialArgs = {
            inherit inputs;
            inherit system;
            inherit pkgs-stable;
          };

          modules = [
            ./server/bundle.nix
            ./core/bundle.nix
            
            inputs.sops-nix.nixosModules.sops
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
