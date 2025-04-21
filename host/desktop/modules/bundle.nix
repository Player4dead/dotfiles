{ pkgs, ... }: {
boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  imports = [
    ./ollama.nix
    ./bluetooth.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./bootloader.nix
    ./sound.nix
    ./user.nix
    ./nvf.nix
    ./amd.nix
    ./hyprland.nix
    #./niri.nix
    ./extern.nix
    ./stylix.nix
    ./gaming.nix
    ./swap.nix
    ./anytype.nix
  ];
}
