{ inputs, ... }:
{

  flake.nixosModules.nh =
    { pkgs, ... }:
    {
      programs.nh = {
        enable = true;
        flake = "/home/player/nixos";
      };
    };
}
