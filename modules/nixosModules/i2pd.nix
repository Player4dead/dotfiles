{
  flake.nixosModules.i2pd = {
    containers.i2pd = {
      autoStart = false;

      bindMounts."/var/lib/private/i2pd" = {
        hostPath = "/var/lib/private/i2pd";
        isReadOnly = false;
      };
      ephemeral = true;

      config = {
        system.stateVersion = "25.11"; # If you don't add a state version, nix will complain at every rebuild

        # Exposing the nessecary ports in order to interact with i2p from outside the container
        networking.firewall.allowedTCPPorts = [
          7656 # default sam port
          7070 # default web interface port
          4447 # default socks proxy port
          4444 # default http proxy port
        ];

        services.i2pd = {
          enable = true;
          settings = {
            addressbook.subscriptions = [
              "http://notbob.i2p/hosts-all.txt"
              "http://inr.i2p/export/alive-hosts.txt"
              "http://i2p-projekt.i2p/hosts.txt"
              "http://stats.i2p/cgi-bin/newhosts.txt"
            ];
          };
        };
      };
    };
  };
}
