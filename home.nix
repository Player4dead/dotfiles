{inputs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./home/bundle.nix
        ];

  home.stateVersion = "25.05";

}
