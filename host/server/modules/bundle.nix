{ pkgs, ... }: {
boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ./xfce.nix
    ./sound.nix
    ./bootloader.nix
    ./user.nix
    ./nvf.nix
    ./swap.nix
    ./hardware-configuration.nix
  ];
}
