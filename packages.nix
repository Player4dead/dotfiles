{ pkgs, inputs, pkgs-stable, ... }: {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # allways installd
    nixfmt-rfc-style
    btop
    tealdeer
    git
    yazi
    tor-browser
    floorp
    pavucontrol
    sops
    jmtpfs
    waybar

    nixd
    keepassxc
    #lmms
    vdhcoapp
    monero-gui
    godot
    mindustry-wayland
    xarchiver
    kdePackages.kdenlive
    blender-hip
    cava
    pcmanfm
    yt-dlp
    activate-linux
    pkgs-stable.lmms

    inputs.zen-browser.packages."${system}".specific
    #inputs.xwayland.packages.x86_64-linux.default
    xwayland-satellite

    ];

}

