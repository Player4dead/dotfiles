{ config, pkgs, callPackage, ... }: {

  services.xserver = {
  enable = true;
  desktopManager = {
    xterm.enable = true;
    xfce.enable = true;
    };
  
  };

}
