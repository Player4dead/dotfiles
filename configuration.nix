# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];

  boot.kernelParams = [ "usbcore.autosuspend=20" ];

  environment.sessionVariables = {
    FLAKE = "/home/player4dead/.dotfiles";
  };

  # nixos
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "desktop"; # Define your hostname.
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "de_CH.UTF-8";
  console.keyMap = "sg";

   system.stateVersion = "24.05"; # Did you read the comment?

}
