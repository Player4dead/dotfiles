{inputs, pkgs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hypr/hyprland.nix
    ./hypr/hyprlock.nix
    #./hypr/hyprpanel.nix
    ./home/bundle.nix
  ];

  home.stateVersion = "25.05";

}



