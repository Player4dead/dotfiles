{ pkgs, inputs, ... }: {

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

    nixd
    keepassxc
    lmms
    vdhcoapp
    monero-gui
    godot
    mindustry-wayland
    xarchiver
    kdePackages.kdenlive
    blender-hip
    cava

    inputs.zen-browser.packages."${system}".specific

    ];

}

