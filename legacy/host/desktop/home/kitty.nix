{ lib, ... }:
{

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.5";
      background_blur = 5;
      dynamic_background_opacity = true;
    };
  };

}
