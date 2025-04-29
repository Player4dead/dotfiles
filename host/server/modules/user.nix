{ pkgs, ... }: {

  users.users.player4dead = {
    isNormalUser = true;
    description = "player4dead";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

}
