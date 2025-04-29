{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.xd
  ];


  containers.i2pd = {
    autoStart = true;
    config = { ... }: {
      
      networking.firewall.allowedTCPPorts = [
        7070 # default web interface port
        4447 # default socks proxy port
        4444 # default http proxy port
	7656 # default torrent port
        5555 # self made port for i2pd to listen
      ];

      services.i2pd = {
        enable = true;
        address = "0.0.0.0"; # you may want to set this to 0.0.0.0 if you are planning to use an ssh tunnel
	port = 5555;
        proto = {
          http.enable = true;
          socksProxy.enable = true;
          httpProxy.enable = true;
	  sam.enable = true;
        };
      };

      system.stateVersion = "24.11";

    };
  };

}
