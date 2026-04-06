{ inputs, ... }:
{

  flake.nixosModules.settings =
    { pkgs, ... }:
    {
      time.timeZone = "Europe/Zurich";

      boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

      i18n.defaultLocale = "de_CH.UTF-8";
      console.keyMap = "sg";

      boot.tmp.cleanOnBoot = true;
    };
}
