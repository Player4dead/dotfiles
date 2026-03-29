{ inputs, ... }:
{

  flake.nixosModules.usb =
    { pkgs, ... }:
    {
      systemd.services = {
        systemd-udev-settle.enable = false;
      };
      services.udisks2.enable = true;
      services.gvfs.enable = true;

    };

}
