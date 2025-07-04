{
  description = "player4deads personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    legacynixpgs.url = "github:nixos/nixpkgs?ref=24.11";

    niri.url = "github:sodiboo/niri-flake";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";

    nixcord.url = "github:kaylorben/nixcord";
    stylix.url = "github:danth/stylix/release-24.11";
    zen-browser = {
      url = "github:MarceColl/zen-browser-flake"; #/96f1b5d80bf7360cb77c9b521f388324f18383a0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, legacynixpgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {


	specialArgs = {
          inherit inputs;
	  inherit system;

          pkgs-stable = import legacynixpgs {
            inherit system;
            config.allowUnfree = true;
          };
        };

        modules = [
          ./desktop/bundle.nix
	  ./packages.nix
	  home-manager.nixosModules.home-manager
	  inputs.nvf.nixosModules.default

	  inputs.sops-nix.nixosModules.sops

          inputs.stylix.nixosModules.stylix

   	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.player4dead = ./desktop/home/bundle.nix;
            home-manager.extraSpecialArgs = { inherit inputs; inherit system; };
            home-manager.backupFileExtension = "backup";

            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
              inputs.niri.homeModules.niri
            ];
          }
        ];
      };
    };
  };
}
