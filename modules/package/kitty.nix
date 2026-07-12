{ inputs, lib, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;
        settings = {
          confirm_os_window_close = 2;

          background_opacity = 0.4;
        };
      };
    };
}
