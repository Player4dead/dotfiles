{ pkgs, config, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./youjo-senki-wallpapers.png;
    polarity = "dark";

      fonts = {
        monospace = {
          package = pkgs.comic-mono;
          name = "ComicMono";
        };
        sansSerif = {
          package = pkgs.comic-mono;
          name = "ComicMono";
        };
       };

    targets.grub = {
      enable = false;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 1;
    };

  };
}
