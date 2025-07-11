# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }: {
  #services.mysql = {
    #enable = true;
    #package = pkgs.mariadb;
  #};

xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
};

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  services.blueman.enable = true;


  fonts.packages = with pkgs; [ junicode ];

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
