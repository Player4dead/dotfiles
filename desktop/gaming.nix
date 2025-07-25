{ pkgs, pkgs-stable, ... }: {
  programs = {
    steam = {
      gamescopeSession.enable = true;
      enable = true;
    };
    gamescope = {
      #package = pkgs-stable.gamescope;
      enable = true;
      capSysNice = false;
    };
    gamemode.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "home/player4dead/.steam/root/compatibilitytools.d";
    };

  environment.systemPackages = with pkgs; [
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs-stable.gamescope
      ];
    })
    
    mangohud
    protonup-qt
    protonup

    (lutris.override {
       extraPkgs = pkgs: [
         wineWowPackages.stable
         winetricks
       ];
    })
  ];
}

