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
        trim = {
          enable = true;
          interval = "weekly";
        };
      };

      services.sanoid = {
        enable = true;

        datasets."zroot/vault" = {
          haurly = 10;
          daily = 5;
          weekly = 3;
          monthly = 1;
        };
      };
    };
}
