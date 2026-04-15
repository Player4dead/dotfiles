{ inputs, self, ... }:
{

  flake.nixosModules.niri =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        jmtpfs
        # kitty
        alacritty
        networkmanagerapplet
        udiskie
        mpvpaper
        fuzzel
        swaylock

        xwayland-satellite
      ];
      programs.waybar.enable = true;
      security.pam.services.swaylock = { };
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.system}.niri;
      };

      xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      xdg.portal.enable = true;

    };
}
