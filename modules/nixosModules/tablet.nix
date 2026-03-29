{
  flake.nixosModules.tablet =
    { pkgs, ... }:
    {
      hardware.opentabletdriver = {
        daemon.enable = true;
        enable = true;
      };

      # Required by OpenTabletDriver
      hardware.uinput.enable = true;
      boot.kernelModules = [ "uinput" ];

    };
}
