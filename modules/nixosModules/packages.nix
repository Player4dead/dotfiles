{ inputs, ... }:
{

  flake.nixosModules = {
    default =
      { pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          devenv
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

        # DELETE ME LATER
        nixpkgs.config.permittedInsecurePackages = [
          "electron-39.8.10"
        ];
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          thunar
          p7zip
          krita
          bitwarden-desktop

          nomacs
          revolt-desktop

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
          inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
      };
  };
}
