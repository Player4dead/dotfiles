{ pkgs, inputs, pkgs-stable, ... }:
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    floorp

    # editor
    zettlr
    nixd

    # libreoffice packages
    #libreoffice-qt
    #hunspell
    #hunspellDicts.de_DE
    #hunspellDicts.de_CH
    #hunspellDicts.en_US

    i2p

    godot_4

    # gaming
    lutris
    mangohud
    heroic
    bottles

   (discord.override {
        withVencord = true;
    })
    vesktop
    #discord

    # random
    xarchiver
    ffmpeg-full
    mpv
    tor-browser
    keepassxc
    qbittorrent
    #blender-hip
    lmms
    openutau

    # download
    vdhcoapp
    yt-dlp

    ];

}
