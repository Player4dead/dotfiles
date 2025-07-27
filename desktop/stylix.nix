{ pkgs, config, ... }:
{

  stylix = {
    enable = true;
    autoEnable = true;
    image = pkgs.fetchurl {
      url = "https://images5.alphacoders.com/792/thumb-1920-792410.png";
      hash = "sha256-Aa8BM4AU+VZfh7pNVrR6r5VUjikUtPr17NCkFQi0OKo=";
    };
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
      enable = false;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 1;
    };

  };
}
