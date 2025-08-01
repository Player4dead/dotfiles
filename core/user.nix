{ pkgs, config, ... }: {

  sops.secrets."test/password".neededForUsers = true;

  programs.zsh.enable = true;

  users.users.player4dead = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "player4dead";
    hashedPasswordFile = config.sops.secrets."test/password".path;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # packages
    ];
  };

}

