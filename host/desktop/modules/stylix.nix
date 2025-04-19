{ pkgs, ... }:
{

  stylix.enable = true;
  stylix.image = ./888880.jpg;
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 1;
  stylix.polarity = "dark";

  stylix.targets.plymouth.enable = false;

}
