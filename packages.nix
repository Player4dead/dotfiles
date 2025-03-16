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
    mindustry
    lutris
    mangohud
    heroic
    the-powder-toy
    bottles

    discord
    hexchat

    # random
    xarchiver
    ffmpeg-full
    mpv
    vlc
    tor-browser
    keepassxc
    #qbittorrent
    #blender-hip
    lmms
    cava

    # download
    vdhcoapp
    yt-dlp

    # hyprland
    waybar
    libnotify
    swww
    kitty
    wofi
    networkmanagerapplet
    udiskie
    hyprshot
    inputs.hyprpolkitagent.packages.x86_64-linux.hyprpolkitagent
  ];

}
