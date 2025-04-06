{
  description = "player4deads personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    legacynixpgs.url = "github:nixos/nixpkgs?ref=24.11";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpolkitagent.url = "github:/hyprwm/hyprpolkitagent";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      self,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };

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
          }
        ];

      };

    };
}
