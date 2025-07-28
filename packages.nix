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
    pavucontrol
    sops
    jmtpfs
    waybar
    fastfetch

    nixd
    keepassxc
    vdhcoapp
    godot
    mindustry-wayland
    blender-hip
    cava
    pcmanfm
    yt-dlp
    pkgs-stable.lmms
    ffmpeg-full
    easyeffects
    upscaler

    inputs.zen-browser.packages."${system}".specific
    xwayland-satellite
    ];

}

