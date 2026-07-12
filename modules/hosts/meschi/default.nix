{ inputs, self, ... }:
{

  flake.nixosConfigurations.meschi = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.meschi ];
    specialArgs = {
      Host = "Desktop";
    };
  };

  flake.nixosModules.meschi =
    { pkgs, ... }:
    {

      nix.settings.trusted-users = [ "player" ];
      programs.dconf.enable = true;
      programs.dconf.profiles.user.databases = [
        {
          lockAll = true;
          settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
        }
      ];

      zramSwap.enable = true;
      systemd.oomd.enable = true;

      fonts.fontconfig.enable = true;

      fonts = {
        enableDefaultPackages = true;

        packages = with pkgs; [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          nerd-fonts.jetbrains-mono
        ];
      };

      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

      imports = [
        self.nixosModules.user
        self.nixosModules.meschihardware
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
        self.nixosModules.packages
        self.nixosModules.sound
        self.nixosModules.boot
        self.nixosModules.i2pd
        self.nixosModules.nh
        self.nixosModules.nix
        self.nixosModules.settings
        # self.nixosModules.swap
        self.nixosModules.zfs
        self.nixosModules.ygg
        self.nixosModules.tablet
        # self.nixosModules.virt
        self.nixosModules.preservation
        self.nixosModules.sanoid
      ];

      networking.hostName = "meschi";
    };

}
