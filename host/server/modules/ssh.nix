{

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PasswordAuthentication = true;
    };

  networking.firewall.allowedTCPPorts = [ 22 ];

}
