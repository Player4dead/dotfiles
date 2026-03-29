{ inputs, ... }:
{

  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      programs = {
        steam = {
          gamescopeSession.enable = true;
          enable = true;
          protontricks.enable = true;
        };
        gamescope = {
          enable = true;
          capSysNice = false;
        };
        gamemode.enable = true;
      };

      environment.systemPackages = with pkgs; [

        (heroic.override {
          extraPkgs =
            pkgs: with pkgs; [
              gamescope
              gamemode
            ];
        })

        mangohud
        protonup-qt
        protontricks

        lutris

      ];
    };
}
