# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }: {

  services.yggdrasil = {
    enable = true;
    persistentKeys = false;
      # The NixOS module will generate new keys and a new IPv6 address each time
      # it is started if persistentKeys is not enabled.

    settings = {
      Peers = [
        "tls://n.ygg.yt:443"
        "tls://b.ygg.yt:443"
        "tcp://s-fra-0.sergeysedoy97.ru:65533"
        "tls://s-fra-0.sergeysedoy97.ru:65534"
     ];
    };
  };

xdg.portal = {
  enable = true;
  xdgOpenUsePortal = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  config.common.default = "*";
};

  security.pam.services.swaylock = {};

  services.udisks2.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ comic-mono ];
  };

  services.gvfs.enable = true;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

  environment.sessionVariables = {
    FLAKE = "/home/player4dead/.dotfiles";
  };

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "sg";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
