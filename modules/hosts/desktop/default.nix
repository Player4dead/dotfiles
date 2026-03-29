{ inputs, self, ... }:
{

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.desktopmain ];
  };

  flake.nixosModules.desktopmain = {
    imports = [
      self.nixosModules.user
      self.nixosModules.hardware
      self.nixosModules.amd
      self.nixosModules.login
      self.nixosModules.niri
      self.nixosModules.nvf
      self.nixosModules.sops
      self.nixosModules.usb
      self.nixosModules.zsh
      self.nixosModules.bluetooth
      self.nixosModules.gaming
      self.nixosModules.net
      self.nixosModules.nixcord
      self.nixosModules.default # default packages
      self.nixosModules.desktop # desktop packages
      self.nixosModules.sound
      self.nixosModules.boot
      self.nixosModules.i2pd
      self.nixosModules.nh
      self.nixosModules.nix
      self.nixosModules.settings
      self.nixosModules.swap
      self.nixosModules.zfs
      # self.nixosModules.ygg
      self.nixosModules.tablet
      # self.nixosModules.virt
    ];

    networking.hostName = "desktop";
  };

}
