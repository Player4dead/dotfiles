{ pkgs, config, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./110679.png;
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
