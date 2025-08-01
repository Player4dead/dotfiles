{ pkgs, ... }:
{

environment.systemPackages = with pkgs; [
  weechat
  xd
  lynx
];


  containers.i2pd = {
    autoStart = true;
    config =
      { ... }:
      {

        system.stateVersion = "25.11";

        # Exposing the nessecary ports in order to interact with i2p from outside the container
        networking.firewall.allowedTCPPorts = [
          7656 # default sam port
          7070 # default web interface port
          4447 # default socks proxy port
          4444 # default http proxy port
          8081 # port of the webserver
          80 # port where we listen to requests
        ];

        services.i2pd = {
          enable = true;
          address = "127.0.0.1"; # you may want to set this to 0.0.0.0 if you are planning to use an ssh tunnel
          proto = {
            http.enable = true;
            socksProxy.enable = true;
            httpProxy.enable = true;
            sam.enable = true;
            i2cp.enable = true;

            httpProxy.outproxy = "http://exit.stormycloud.i2p";
          };

          inTunnels = {
            blog = {
              enable = true;
              keys = "blog-keys.data";
              inPort = 80;
              adsress = "127.0.0.1";
              destination = "127.0.0.1";
              port = 8081;

            };
          };
        };
      };
  };
}
