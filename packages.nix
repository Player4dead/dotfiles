{ pkgs, inputs, pkgs-stable, ... }: {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    btop
    tealdeer
    git
    yazi
    sops
    jmtpfs
    fastfetch
    unzip
    nixd
    lynx
    xfce.thunar
    ];

}

