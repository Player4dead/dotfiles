{ inputs, ... }:
{

  flake.nixosModules.virt =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.qemu
        pkgs.quickemu
        pkgs.quickgui
      ];

      programs.virt-manager.enable = true;

      users.groups.libvirtd.members = [ "player4dead" ];

      virtualisation.libvirtd.enable = true;
      virtualisation.spiceUSBRedirection.enable = true;

    };
}
