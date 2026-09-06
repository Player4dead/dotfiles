{
  inputs,
  ...
}:
{
  flake.nixosModules.packages =
    { pkgs, ... }:
    let
      packages = with pkgs; [
        nixfmt
        btop
        git
        unzip
        unrar
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        p7zip
        thunar
        # keepassxc
        pavucontrol
        nixd
        jujutsu
        bat
        tack

        nomadnet
        renode
      ];

      hostPackages = with pkgs; [
        krita
        # bitwarden-desktop

        helix

        revolt-desktop
        cinny-desktop

        tor-browser
        godot
        yt-dlp
        ffmpeg-full
        qbittorrent

        # hexchat
        # easyeffects

        eden
        librewolf

        # to do: own package
        (mpv.override {
          scripts = with pkgs.mpvScripts; [
            uosc
            visualizer
            videoclip
            quality-menu
            occivink.encode
          ];
        })
      ];
    in
    {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = packages ++ hostPackages;
    };
}
