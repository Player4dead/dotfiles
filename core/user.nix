{ pkgs, config, ... }: {

  sops.secrets.password.neededForUsers = true;

  programs.zsh.enable = true;

  users.users.player4dead = {
    shell = pkgs.zsh;
    description = "player4dead";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # packages
    ];


    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.password.path;
  };

}

