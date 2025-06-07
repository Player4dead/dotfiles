{
  description = "player4deads personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    legacynixpgs.url = "github:nixos/nixpkgs?ref=24.11";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
      };
   };

   nixcord.url = "github:kaylorben/nixcord";
   stylix.url = "github:danth/stylix/release-24.11";

  };

  outputs = { nixpkgs, home-manager, legacynixpgs, ... }@inputs:
  let
    system = "x86_64-linux";
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

	  inputs.agenix.nixosModules.default
	  inputs.sops-nix.nixosModules.sops

          inputs.stylix.nixosModules.stylix

   	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.player4dead = ./desktop/home/bundle.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";

	    environment.systemPackages = [ inputs.agenix.packages.${system}.default ];

            home-manager.sharedModules = [
              inputs.nixcord.homeModules.nixcord
            ];
          }
        ];
      };
    };
  };
}
