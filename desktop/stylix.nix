{ pkgs, config, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./888880.jpg;
    polarity = "dark";

      fonts = {
        monospace = {
          package = pkgs.comic-mono;
          name = "ComicMono";
        };
        sansSerif = {
          package = pkgs.source-sans;
          name = "SourceSans3";
        };
       };

    targets.grub = {
      enable = true;
      #useWallpaper = true;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 1;
    };

  };
}
