{inputs, ...}: {
  flake.nixosModules.preservation = {
    imports = [inputs.preservation.nixosModules.default];

    boot.tmp.cleanOnBoot = true;
    security.sudo.extraConfig = "Defaults lecture=never";
    boot.zfs.forceImportRoot = true;

    preservation = {
      enable = true;

      preserveAt = {
        "/steam".users.player.directories = [
          ".local/share/Steam"
        ];

        "/persist".users.player.directories = ["projekt"];

        "/cache" = {
          directories = [
            "/var/lib/bluetooth"
            "/var/lib/NetworkManager"
            "/etc/NetworkManager"
            "/var/lib/i2pd"
            "/var/cache/tailscale"
            "/var/lib/tailscale"
            {
              directory = "/var/lib/nixos";
              inInitrd = true;
            }
          ];

          # Preserve user files
          users.player = {
            directories = [
              "nixos"
              ".config/OpenTabletDriver"
              ".config/Vencord"
              ".config/zen"
              ".config/discord"
              ".config/noctalia"
              ".config/librewolf"
              ".ssh"
              ".tor project"
              ".local/share/lutris"
              ".cache/lutris"
              ".config/keepassxc"
              ".config/heroic"
              ".local/share/umu"
              "Games"
              ".config/qBittorrent"
              ".local/share/qBittorrent"
              ".config/Bitwarden"
              "Downloads"
              ".config/eden"
              ".local/share/in.cinny.app"
              ".config/helix"
            ];
            #
            files = [
              ".zsh_history"
              ".zshrc"
              ".config/kritac"
              ".z"
              {
                file = ".config/sops/age/keys.txt";

                inInitrd = true;
              }
            ];
          };
        };
      };
    };
  };
}
