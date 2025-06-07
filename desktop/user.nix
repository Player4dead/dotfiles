{ pkgs, pkgs-stable, ... }: {

  users.users.player4dead = {
    isNormalUser = true;
    description = "player4dead";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # packages
    ];
  };

}

