{ pkgs, pkgs-stable, ... }:
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # browser
    tor-browser
    floorp

    nixd

    # libreoffice packages
    #libreoffice-qt
    #hunspell
    #hunspellDicts.de_DE
    #hunspellDicts.de_CH
    #hunspellDicts.en_US

    i2p

    pkgs-stable.godot_4

    # gaming
    lutris
    mangohud
    heroic
    bottles
    protonup

    # random
    xarchiver
    ffmpeg-full
    mpv
    keepassxc
    qbittorrent
    blender-hip
    lmms
    openutau
    amberol
    kdePackages.kdenlive
    audacity

    # download
    vdhcoapp
    yt-dlp

    ];

}
