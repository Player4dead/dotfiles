{
  description = "player4deads personal flake";

  inputs = {
    unstablenixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    legacynixpgs.url = "github:nixos/nixpkgs?ref=24.11";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "unstablenixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixcord.url = "github:kaylorben/nixcord";
    };

  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      self,
      legacynixpgs,
      unstablenixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;

          pkgs-stable = import legacynixpgs {
            inherit system;
            config.allowUnfree = true;
          };
          nixpkgs = import unstablenixpkgs { inherit system; };
        };

        modules = [
          ./host/desktop/modules/bundle.nix
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = false;
            home-manager.users.player4dead = import ./host/desktop/home/bundle.nix;
            home-manager.extraSpecialArgs = { inherit inputs; }; 
            home-manager.backupFileExtension = "backup";

            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
            ];

          }
        ];

      };

        nixosConfigurations.server = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;

          pkgs-stable = import legacynixpgs {
            inherit system;
            config.allowUnfree = true;
          };

        nixpkgs = import legacynixpgs { inherit system; };
        };

        modules = [
          ./host/server/modules/bundle.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          {
            home-manager.useUserPackages = false;
            home-manager.users.player4dead = import ./host/server/home/bundle.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
          }
        ];

      };

    };
}
