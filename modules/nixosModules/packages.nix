{ inputs, ... }:
{

  flake.nixosModules = {
    default =
      { pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          nixfmt
          btop
          tealdeer
          git
          yazi
          unzip
          lynx
          tmux
        ];
      };

    desktop =
      { pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          thunar
          p7zip
          krita

          nomacs
          revolt-desktop
          fluffychat
          element-desktop

          keepassxc
          pavucontrol
          tor-browser
          godot
          yt-dlp
          ffmpeg-full
          qbittorrent

          lmms

          hexchat
          easyeffects

          ryubing
          inputs.zen-browser.packages.${pkgs.system}.default
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

          inputs.stable.legacyPackages.x86_64-linux.kdePackages.kdenlive

        ];
      };
  };
}
