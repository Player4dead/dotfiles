{ pkgs, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./110679.png;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 1;
    };

  };
}
