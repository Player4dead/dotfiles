{ inputs, ... }:
{

  flake.nixosModules.net = {
    networking.networkmanager.enable = true;
    services.tailscale = {
      enable = true;
    };
  };
}
