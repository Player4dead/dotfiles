{ pkgs, pkgs-stable, inputs, config, lib, system, ... }:
{

home.packages = with pkgs; [
  libnotify
  swww
  kitty
  networkmanagerapplet
  udiskie
  fuzzel
  libsForQt5.polkit-kde-agent
];

  programs.swaylock.enable = true;
  services.mako.enable = true;

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    package = pkgs.niri-unstable;
    enable = true;

    settings = {
      prefer-no-csd = true;
      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite-unstable;
      };
      environment."NIXOS_OZONE_WL" = "1";
      outputs = {
        "DP-1" = {
          enable = true;
          focus-at-startup = false;
          mode = {
            height = 1080;
            width = 1920;
            refresh = 60.000;
          };
          scale = 1;
          position = {
            x = 0;
            y = 0;
          };
        };
        "DP-2" = {
          enable = true;
          focus-at-startup = true;
          mode = {
            height = 1080;
            width = 1920;
            refresh = 143.9810;
          };
          scale = 1;
          position = {
            x = 1920;
            y = 0;
          };
        };
      };

      binds = with config.lib.niri.actions; {
        "Mod+Q".action = spawn "kitty";
        "Mod+Space".action = spawn "fuzzel";
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "Mod+C".action = close-window; 
        "Mod+L".action = spawn "swaylock";

        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;

        "Mod+Shift+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Right".action = move-column-to-monitor-right;
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Shift+Comma".action = expel-window-from-column;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
        "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;

        "Mod+Shift+F".action = fullscreen-window;
        "Mod+F".action = maximize-column;
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Shift+Minus".action = set-column-width "+10%";
        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
        "Mod+W".action = toggle-column-tabbed-display;
        "Print".action = screenshot;
        "Alt+Print".action = screenshot-window;
        "Mod+Shift+M".action = quit;
      };

      spawn-at-startup = [
        { command = [ "waybar" ]; }
        { command = [ "zen" ]; }
        { command = [ "discord" ]; }
        { command = [ "udiskie -a -n" ]; }
        { command = [ "swww-daemon" ]; }
        { command = [ "systemctl --user start plasma-polkit-agent" ]; }
      ];

      input = {
        focus-follows-mouse.enable = false;
        keyboard.xkb.layout = "ch";
        mouse.accel-profile = "adaptive";
        mouse.natural-scroll = false;
        warp-mouse-to-focus.enable = true;
      };

      layout = {
        gaps = 3;
        border = {
          enable = true;
          width = 4;
        };
        tab-indicator = {
          enable = true;
          corner-radius = 2.0;
        };
        focus-ring.enable = false;

        insert-hint.enable = true;
      };

      window-rules = [
        {
          matches = [{ app-id = "org.keepassxc.KeePassXC"; }];
          block-out-from = "screen-capture";
        }
      ];

    };
  };

}
