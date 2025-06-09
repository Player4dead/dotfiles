{ pkgs, ... }: {

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
    sops

    nixd
    keepassxc
    lmms
    vdhcoapp
    monero-gui
    godot
    mindustry-wayland
    xarchiver

    ];

}

