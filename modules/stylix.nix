{ pkgs, ... }: {

  stylix.enable = true;
  stylix.image = ./888880.jpg;
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.polarity = "dark";

  stylix.targets.plymouth.enable = false;

}
