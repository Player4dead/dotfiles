{ inputs, ... }:
{

  flake.nixosModules.preservation = {
    imports = [ inputs.preservation.nixosModules.default ];

    boot.tmp.cleanOnBoot = true;
    security.sudo.extraConfig = "Defaults lecture=never";

    preservation = {
      enable = true;

      preserveAt = {
        "/steam".users.player.directories = [
          ".local/share/Steam"
        ];

        "/persist".users.player.directories = [ "projekt" ];

        "/cache" = {
          directories = [
            "/etc/nixos"
            "/var/lib/bluetooth"
            "/var/lib/NetworkManager"
            "/etc/NetworkManager"
            "/var/lib/i2pd"
            {
              directory = "/var/lib/nixos";
              inInitrd = true;
            }
          ];

          # files = [
          #   {
          #     file = "/etc/machine-id";
          #     inInitrd = true;
          #   }
          # ];

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
              ".config/keepassxc"
              ".config/heroic"
              ".local/share/umu"
              "Games"
              ".config/qBittorrent"
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
