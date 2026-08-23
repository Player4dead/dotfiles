{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}
