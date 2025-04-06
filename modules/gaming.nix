{ inputs, pkgs, ... }: {
  # gaming
  programs = {
    steam = {
      gamescopeSession.enable = true;
      enable = true;
    };
    gamescope = {
      package = inputs.legacynixpgs.legacyPackages.${pkgs.system}.gamescope;
      enable = true;
      capSysNice = false;
    };
    gamemode.enable = true;
  };
}
