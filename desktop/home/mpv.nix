{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
          ffmpeg = pkgs.ffmpeg-full;
        };
        scripts = with pkgs.mpvScripts; [
          uosc
          visualizer
          videoclip
          quality-menu
          occivink.encode
          #autosub
        ];
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}

