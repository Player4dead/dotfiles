{ pkgs-stable, ... }: {

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

}
