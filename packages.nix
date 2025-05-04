{ pkgs, inputs, pkgs-stable, ... }:
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # wichtige packete
    nixfmt-rfc-style
    microcodeAmd
    nomacs
    alsa-utils
    btop
    nemo
    tealdeer
    git
    yazi
    pavucontrol
    gparted

    ];

}
