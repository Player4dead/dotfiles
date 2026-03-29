{ inputs, ... }:
{

  flake.nixosModules.ygg =
    { pkgs, ... }:
    {
      services.yggdrasil = {
        enable = true;
        persistentKeys = false;

        settings = {
          Peers = [
            "quic://31.57.241.104:65535"
            "quic://des.8px.sk:4321"
          ];
        };
      };
    };
}
