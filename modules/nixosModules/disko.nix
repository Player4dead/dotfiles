{ inputs, ... }:
{

  flake.diskoConfigurations.desktop = {
    imports = [
      inputs.disko.flakeModules.default
    ];
    fileSystems."/nix".neededForBoot = true;

    disko.devices = {
      nodev = {
        "/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };
      };

      disk.main = {
        device = "/dev/nvme0n1"; # MAKE SURE TOO SELECT CORRECT DISK HERE
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02";
            };

            esp = {
              name = "ESP";
              size = "1G";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };

            swap = {
              size = "16G";

              content = {
                type = "swap";
                resumeDevice = true;
              };
            };

            zfs = {
              size = "100%";

              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };

      };

      zpool.zroot = {

        type = "zpool";
        rootFsOptions = {
          mountpoint = "none";
          compression = "zstd";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "false";
        };
        options.ashift = "12";

        datasets = {
          "zroot" = {
            type = "zfs_fs";
            options = {
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              #keylocation = "file:///tmp/secret.key";
              keylocation = "prompt";
            };
            mountpoint = "none";
          };

          "zroot/nix" = {
            type = "zfs_fs";
            options.mountpoint = "/nix";
            mountpoint = "/nix";
          };

          "zroot/persistent" = {
            type = "zfs_fs";
            options.mountpoint = "/persistent";
            mountpoint = "/persistent";
          };

          "zroot/cache" = {
            type = "zfs_fs";
            options.mountpoint = "/cache";
            mountpoint = "/cache";
          };

          "zroot/tmp" = {
            type = "zfs_fs";
            options.mountpoint = "/tmp";
            mountpoint = "/tmp";
          };
        };
      };
    };
  };
}
