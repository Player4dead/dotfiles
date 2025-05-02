{ pkgs, ... }: {
boot.kernelPackages = pkgs.linuxPackages_latest;
networking.hostName = "server";
services.logind.lidSwitchExternalPower = "ignore";

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
    ./shell.nix
    ./ssh.nix
  ];
}
