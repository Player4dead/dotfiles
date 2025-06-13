{pkgs, inputs, ...}: {

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    package = pkgs.niri-unstable;
    niri-flake.cache.enable = false;
    enable = true;

    config = null;
  };
}
