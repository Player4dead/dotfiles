# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];
  
  environment.sessionVariables = {
    FLAKE = "/home/player4dead/.dotfiles";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # nixos
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  networking.hostName = "server"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "de_CH.UTF-8";
  console.keyMap = "ch";

   system.stateVersion = "24.05"; # Did you read the comment?

}
