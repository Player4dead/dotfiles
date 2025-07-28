{ ... }:
{
  containers.i2pd = {
    autoStart = false;
    config =
      { ... }:
      {

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
          address = "127.0.0.1"; # you may want to set this to 0.0.0.0 if you are planning to use an ssh tunnel
          proto = {
            http.enable = true;
            socksProxy.enable = true;
            httpProxy.enable = true;
            sam.enable = true;
          };
        };
      };
  };
}
