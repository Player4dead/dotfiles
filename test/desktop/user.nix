{ pkgs, config, ... }: {

  sops.secrets."test/password".neededForUsers = true;

  users.users.player4dead = {
    isNormalUser = true;
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

