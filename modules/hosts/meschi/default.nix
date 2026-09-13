{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.meschi = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.meschi ];
    specialArgs = {
      Host = "Desktop";
    };
  };

  flake.nixosModules.meschi = { pkgs, ... }: {
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

    services.netbird.clients.wt0 = {

      # Automatically login to your Netbird network with a setup key
      # This is mostly useful for server computers.
      # For manual setup instructions, see the wiki page section below.
      login = {
        enable = false;

        # Path to a file containing the setup key for your peer
        # NOTE: if your setup key is reusable, make sure it is not copied to the Nix store.
        # setupKeyFile = "/path/to/your/setup-key";
      };

      # Port used to listen to wireguard connections
      port = 51821;

      # Set this to true if you want the GUI client
      ui.enable = false;

      # This opens ports required for direct connection without a relay
      openFirewall = true;

      # This opens necessary firewall ports in the Netbird client's network interface
      openInternalFirewall = true;
    };

    security.pki.certificateFiles = [ ./raspi.netbird.cloud.crt ];

    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

    imports = [
      self.nixosModules.user
      self.nixosModules.meschihardware
      self.nixosModules.amd
      self.nixosModules.login
      self.nixosModules.niri
      # self.nixosModules.nvf
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
      # self.nixosModules.ygg
      self.nixosModules.tablet
      # self.nixosModules.virt
      self.nixosModules.preservation
      self.nixosModules.sanoid

      inputs.nixos-core.nixosModules.nixos-core
    ];

    networking.hostName = "meschi";
  };
}
