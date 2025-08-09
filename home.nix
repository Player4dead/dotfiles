{ pkgs-stable, pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "player4dead";
    userEmail = "player4dead@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs-stable.hello
  ];
  home.stateVersion = "25.05";


  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };

}
