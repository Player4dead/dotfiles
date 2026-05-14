{ inputs, ... }:
{

  flake.nixosModule.preservation = {
    imports = [ inputs.preservation.nixosModules.default ];

    boot.tmp.cleanOnBoot = true;
    security.sudo.extraConfig = "Defaults lecture=never";

    preservation = {
      enable = true;

      preserveAt."/cache" = {
        directories = [
          "/etc/nixos"
          "/var/lib/bluetooth"
          "/var/lib/NetworkManager"
          {
            directory = "/var/lib/nixos";
            inInitrd = true;
          }
        ];

        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
        ];

        # Preserve user files
        users.player = {
          directories = [
            "nixos"
            #     ".ssh"
            #     ".mozilla"
          ];
          #
          files = [

          ];
        };
      };
    };
  };
}
