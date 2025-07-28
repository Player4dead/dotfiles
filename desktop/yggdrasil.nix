{ ... }:
{

  containers.yggdrasil = {

    autoStart = false;
    privateNetwork = false;
    config =
      { ... }:
      {

        services.yggdrasil = {
          enable = true;
          persistentKeys = false;

          settings = {
            Peers = [
              "tls://n.ygg.yt:443"
              "tls://b.ygg.yt:443"
              "tcp://s-fra-0.sergeysedoy97.ru:65533"
              "tls://s-fra-0.sergeysedoy97.ru:65534"
            ];
          };
        };

        system.stateVersion = "25.11";
      };
  };
}
