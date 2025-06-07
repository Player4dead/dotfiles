{ inputs, ... }: {

  programs.git = {
    enable = true;
    userName = "player4dead";
    userEmail = "player4dead@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05";

}
