{ inputs, ... }:
{

  flake.nixosModules.zfs =
    { pkgs, ... }:
    {

      networking.hostId = "2ff08ffe";

      boot.kernelParams = [
        "zfs.zfs_arc_max=4294967296"
        "zfs.zfs_arc_min=2147483648"
      ];

      services.zfs = {
        autoScrub = {
          enable = true;
          pools = [ ]; # empty to scrub everything
          interval = "monthly";
        };
        autoSnapshot.enable = true;

        trim = {
          enable = true;
          interval = "weekly";
        };
      };
    };
}
