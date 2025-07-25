{ lib, pkgs,  ... }:
{

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.7";
      background_blur = 1;
      dynamic_background_opacity = true;
    };

  };

}
