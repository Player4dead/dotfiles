{
  pkgs,
  inputs,
  pkgs-stable,
  system,
  ...
}:
{

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

    xwayland-satellite

    inputs.zen-browser.packages."${system}".default
    ];
    #inputs.zen-browser.packages."${system}".default.override = {
      #policies = {
        #DisableAppUpdate = true;
        #DisableTelemetry = true;
        # find more options here: https://mozilla.github.io/policy-templates/
      #};
      #};

}
