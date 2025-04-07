{ pkgs, inputs, ... }:
{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # wichtige packete
    nixfmt-rfc-style
    home-manager
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
    nh

    floorp

    # editor
    zettlr
    nixd

    # libreoffice packages
    libreoffice-qt
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.de_CH
    hunspellDicts.en_US

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
    #discord

    # random
    xarchiver
    ffmpeg-full
    mpv
    tor-browser
    keepassxc
    #qbittorrent
    #blender-hip
    lmms

    # download
    vdhcoapp
    yt-dlp

    # hyprland
    waybar
    libnotify
    swww
    kitty
    networkmanagerapplet
    udiskie
    hyprshot
    inputs.hyprpolkitagent.packages.x86_64-linux.hyprpolkitagent
    fuzzel
  ];

}
