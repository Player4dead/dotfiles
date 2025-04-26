{ pkgs, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./888880.jpg;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 1;
    };

  };
}
