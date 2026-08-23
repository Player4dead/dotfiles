{
  inputs,
  lib,
  ...
}: {
  systems = ["x86_64-linux"];
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        hotkey-overlay.skip-at-startup = _: {};
        prefer-no-csd = true;
        input = {
          # focus-follows-mouse = ''"max-scroll-amount"="10%"'';
          keyboard.xkb.layout = "ch";
          mouse.accel-profile = "adaptive";
          # warp-mouse-to-focus = _: {};
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
          "Mod+Q".spawn = lib.getExe self'.packages.myKitty;
          "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+C".close-window = _: {};
          "Mod+Z".spawn = lib.getExe inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
          "Mod+E".spawn-sh = "${lib.getExe self'.packages.myKitty} -e ${lib.getExe pkgs.yazi}";

          "Mod+L".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call lockScreen lock";

          "Mod+Left".focus-column-or-monitor-left = _: {};
          "Mod+Down".focus-window-or-workspace-down = _: {};
          "Mod+Up".focus-window-or-workspace-up = _: {};
          "Mod+Right".focus-column-or-monitor-right = _: {};

          "Mod+Shift+Left".move-column-left-or-to-monitor-left = _: {};
          "Mod+Shift+Down".move-window-down-or-to-workspace-down = _: {};
          "Mod+Shift+Up".move-window-up-or-to-workspace-up = _: {};
          "Mod+Shift+Right".move-column-right-or-to-monitor-right = _: {};

          "Mod+Comma".consume-window-into-column = _: {};
          "Mod+Shift+Comma".expel-window-from-column = _: {};

          "Mod+Shift+F".fullscreen-window = _: {};
          "Mod+F".maximize-column = _: {};
          "Mod+G".expand-column-to-available-width = _: {};
          "Mod+Minus".set-column-width = "-10%";
          "Mod+Shift+Minus".set-column-width = "+10%";
          "Mod+V".toggle-window-floating = _: {};
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: {};
          "Mod+W".toggle-column-tabbed-display = _: {};
          "Mod+Shift+M".quit = _: {};
          "Mod+Tab".toggle-overview = _: {};
          "Print".screenshot = _: {};
        };
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)

          "zen"

          [
            "${lib.getExe' pkgs.udiskie "udiskie"}"
            "-a"
            "-n"
          ]

          "otd-daemon"

          [
            "${lib.getExe pkgs.mpvpaper}"
            "-o"
            "--no-audio --loop-file=inf --no-keepaspect"
            "ALL"
            "/vault/wallpaper/wallpaper.mp4"
          ]
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        window-rules = [
          {
            matches = [
              {app-id = "org.keepassxc.KeePassXC";}
              {app-id = "Tor Browser";}
            ];
            block-out-from = "screen-capture";
          }
          #
          {
            matches = [{app-id = ".*.";}];
            geometry-corner-radius = 8;
            clip-to-geometry = true;
            draw-border-with-background = false;
          }
          #
          # {
          #   matches = [{is-active = false;}];
          #   opacity = 0.75;
          # }
        ];

        outputs = {
          "DP-1" = {
            mode = "1920x1080@60.000";
            transform = "90";
            position = _: {
              props = {
                x = 4017;
                y = 0;
              };
            };
          };
          "DP-2" = {
            focus-at-startup = _: {};
            variable-refresh-rate = _: {};
            mode = "2560x1440@143.998";
            scale = 1.3;

            position = _: {
              props = {
                x = 2048;
                y = 0;
              };
            };
          };
          "HDMI-A-2" = {
            variable-refresh-rate = _: {};
            mode = "2048x1152@60.000";
            position = _: {
              props = {
                x = 0;
                y = 0;
              };
            };
          };
        };

        include = "${./niri-animation.kdl}";
      };
    };
  };
}
