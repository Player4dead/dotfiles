{
  description = "player4deads personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #ladybird.url = "github:LadybirdBrowser/ladybird";
  };

  outputs = { nixpkgs, home-manager, nvf, ... } @ inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    	system = "x86_64-linux";
	specialArgs = { inherit inputs; };

	modules = [
		./configuration.nix
		inputs.stylix.nixosModules.stylix
		home-manager.nixosModules.home-manager
		nvf.nixosModules.default
      {
      	home-manager.useUserPackages = false;
      	home-manager.users.player4dead = import ./home.nix;
	home-manager.extraSpecialArgs = { inherit inputs; };
	home-manager.backupFileExtension = "backup";

        #nixpkgs.overlays =
                #[ inputs.hyprpanel.overlay inputs.nur.overlays.default ];
              #_module.args = { inherit inputs; };
      }
	];

    };

  };
}
