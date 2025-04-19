{ pkgs-stable, pkgs, ... }: {
  # gaming
  programs = {
    steam = {
      gamescopeSession.enable = true;
      enable = true;
    };
    gamescope = {
      package = pkgs-stable.gamescope;
      enable = true;
      capSysNice = false;
    };
    gamemode.enable = true;
  };
}
