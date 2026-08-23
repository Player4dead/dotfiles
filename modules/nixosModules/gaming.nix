{inputs, ...}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs = {
      steam = {
        protontricks.enable = true;

        gamescopeSession.enable = true;
        enable = true;

        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
      gamescope = {
        enable = true;
        capSysNice = false;
        args = [
          "-W 2560"
          "-H 1440"
          "-w 1920"
          "-h 1080"
          "--force-grab-cursor"
          "--backend wayland"
          "-b"
          "-r 144"
        ];
      };
      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
      (heroic.override {
        extraPkgs = pkgs:
          with pkgs; [
            gamescope
            gamemode
          ];
      })

      mangohud
      protonup-qt
      protontricks

      (lutris.override {
        # List of additional system libraries
        extraLibraries = pkgs: [winetricks];

        # List of additional system packages
        extraPkgs = pkgs: [
          winetricks
          wine
        ];
      })
    ];
  };
}
