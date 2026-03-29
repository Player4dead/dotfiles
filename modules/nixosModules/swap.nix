{ inputs, ... }:
{

  flake.nixosModules.swap =
    { pkgs, ... }:
    {
      swapDevices = [
        {
          device = "/swap";
          size = 16 * 1024;
        }
      ];
    };
}
