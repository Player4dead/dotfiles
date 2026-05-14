{ inputs, self, ... }:
{

  flake.nixosModules.niri =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        jmtpfs
      ];
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.system}.myNiri;
      };

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };

    };
}
