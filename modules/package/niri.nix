{ inputs, lib, ... }:
{
  systems = [ "x86_64-linux" ];
  perSystem =
    { pkgs, self', ... }:
    {

      packages.niri =
        (inputs.wrappers.wrapperModules.niri.apply {
          inherit pkgs;
          settings = {
            hotkey-overlay.skip-at-startup = null;
            prefer-no-csd = true;
            input = {
              keyboard.xkb.layout = "ch";
              mouse.accel-profile = "adaptive";
              warp-mouse-to-focus = null;
            };

            layout = {
              gaps = 3;
              border = {
                width = 4;
                # active-color = "#f5c2e7";
                inactive-color = "#313244";
              };
            };

            binds = {
              "Mod+Q".spawn = "kitty";
              "Mod+Space".spawn = "fuzzel";
              "Mod+C".close-window = null;
              "Mod+Z".spawn = "zen";

              "Mod+Left".focus-column-or-monitor-left = null;
              "Mod+Down".focus-window-or-workspace-down = null;
              "Mod+Up".focus-window-or-workspace-up = null;
              "Mod+Right".focus-column-or-monitor-right = null;

              "Mod+Shift+Left".move-column-left-or-to-monitor-left = null;
              "Mod+Shift+Down".move-window-down-or-to-workspace-down = null;
              "Mod+Shift+Up".move-window-up-or-to-workspace-up = null;
              "Mod+Shift+Right".move-column-right-or-to-monitor-right = null;

              "Mod+Comma".consume-window-into-column = null;
              "Mod+Shift+Comma".expel-window-from-column = null;

              "Mod+Shift+F".fullscreen-window = null;
              "Mod+F".maximize-column = null;
              "Mod+G".expand-column-to-available-width = null;
              "Mod+Minus".set-column-width = "-10%";
              "Mod+Shift+Minus".set-column-width = "+10%";
              "Mod+V".toggle-window-floating = null;
              "Mod+Shift+V".switch-focus-between-floating-and-tiling = null;
              "Mod+W".toggle-column-tabbed-display = null;
              "Mod+L".spawn = "swaylock";
              "Mod+Shift+M".quit = null;
              "Mod+Tab".toggle-overview = null;
              "Mod+E".spawn-sh = "kitty -e yazi";
              "Print".screenshot = null;
            };
            spawn-at-startup = [
              "zen"

              [
                "udiskie"
                "-a"
                "-n"
              ]

              "discord"

              "otd-daemon"

              [
                "mpvpaper"
                "-o"
                "--no-audio --loop-file=inf"
                "ALL"
                "/home/player4dead/Videos/wallpaper.mp4"
              ]

              "waybar"
            ];

            xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
            window-rules = [
              {
                matches = [
                  { app-id = "org.keepassxc.KeePassXC"; }
                  { app-id = "Tor Browser"; }
                ];
                block-out-from = "screen-capture";
              }
              #
              {
                matches = [ { app-id = ".*."; } ];
                geometry-corner-radius = 8;
                clip-to-geometry = true;
                draw-border-with-background = false;
              }
              #
              {
                matches = [ { is-active = false; } ];
                opacity = 0.75;
              }
            ];

            outputs = {
              "DP-1" = {
                position = {
                  _attrs = {
                    x = 0;
                    y = 0;
                  };
                };
              };
              "DP-2" = {
                focus-at-startup = null;
                variable-refresh-rate = null;
                position = {
                  _attrs = {
                    x = 1920;
                    y = 0;
                  };
                };
              };
            };

            include = "${./niri-animation.kdl}";


          };
        }).wrapper;
    };
}
