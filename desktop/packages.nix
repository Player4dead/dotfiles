{ pkgs, inputs, pkgs-stable, ... }: {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    keepassxc
    pavucontrol
    waybar
    tor-browser
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
