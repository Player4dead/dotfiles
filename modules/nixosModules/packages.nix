{
  inputs,
  Host,
  ...
}:
{

  flake.nixosModules.packages =
    { pkgs, ... }:
    let
      packages = with pkgs; [
        devenv
        nixfmt
        btop
        tealdeer
        git
        unzip
        lynx
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        p7zip
        thunar
        keepassxc
        pavucontrol
      ];

      hostPackages = with pkgs; [
        krita
        # bitwarden-desktop

        nomacs
        revolt-desktop

        tor-browser
        godot
        yt-dlp
        ffmpeg-full
        qbittorrent

        lmms

        hexchat
        easyeffects

        ryubing
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

        (blender.override {
          config.rocmSupport = true;
          config.cudaSupport = false;
        })

      ];
      # [
      #   joplin-desktop
      #   brightnessctl
      # ];
    in
    {
      nixpkgs.config.allowUnfree = true;

      # DELETE ME
      nixpkgs.config.permittedInsecurePackages = [
        "electron-39.8.10"
      ];

      environment.systemPackages = packages ++ hostPackages;

      programs.thunderbird.enable = true;
    };

}
