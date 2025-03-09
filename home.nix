{inputs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hypr/hyprland.nix
    ./hypr/hyprlock.nix
    ./home/bundle.nix
  ];

  home.stateVersion = "25.05";

}



