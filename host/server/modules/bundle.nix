{ pkgs, ... }: {
boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ./packages.nix
    #./xfce.nix
    ./sound.nix
    ./bootloader.nix
    ./user.nix
    ./nvf.nix
    ./swap.nix
    ./hardware-configuration.nix
    ./i2pd.nix
  ];
}
