{ pkgs, inputs, pkgs-stable, ... }:
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
        lynx
        xd
];
}
