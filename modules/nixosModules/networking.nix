{ inputs, ... }:
{

  flake.nixosModules.net = {
    networking.networkmanager.enable = true;
  };
}
