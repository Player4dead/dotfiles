{ pkgs, inputs, config, ... }:
{

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    package = pkgs.niri-unstable;
    enable = true;

    config = null;

    settings = {
      environment."NIXOS_OZONE_WL" = "1";
      outputs = {
        "DP-1" = {
          enable = true;
          focus-at-startup = false;
          mode = {
            height = 1080;
            width = 1920;
            refresh = 60;
            scale = 1;
            position = {
              x = 0;
              y = 0;
            };
          };
        };
        "DP-2" = {
          enable = true;
          focus-at-startup = true;
          mode = {
            height = 1080;
            width = 1920;
            refresh = 144;
            scale = 1;
            position = {
              x = 1920;
              y = 0;
            };
          };
        };
      };

      binds = with config.lib.niri.actions; {
        "Mod+Q".action = spawn "alacritty";
        "Mod+Space".action = spawn "fuzzel";
        "XF86AudioRaiseVolume".action= spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "Mod+C".action = quit { skip-confirmation=true; };
        "Mod+Plus".action = set-column-width "+10%";

        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Shift+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Right".action = move-column-to-monitor-right;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Shift+1".action = move-column-to-workspace 1;
        "Mod+Shift+2".action = move-column-to-workspace 2;
        "Mod+Shift+3".action = move-column-to-workspace 3;
        "Mod+Shift+4".action = move-column-to-workspace 4;
        "Mod+Shift+5".action = move-column-to-workspace 5;
        "Mod+Shift+6".action = move-column-to-workspace 6;
        "Mod+Shift+7".action = move-column-to-workspace 7;
        "Mod+Shift+8".action = move-column-to-workspace 8;
        "Mod+Shift+9".action = move-column-to-workspace 9;

        "Mod+Shift+F".action = fullscreen-window;
        "Mod+F".action = maximize-column;
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
        "Mod+W".action = toggle-column-tabbed-display;
        "Print".action = screenshot;
        "Ctrl+Print".action = screenshot-screen;
        "Alt+Print".action = screenshot-window;
        "Mod+P".action = power-off-monitors;
      };
    };
  };
}
