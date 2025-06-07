{
  programs.nixcord = {
  enable = true;
    config = {
      themeLinks = [
        "https://capnkitten.github.io/BetterDiscord/Themes/Material-Discord/css/source.css"
      ];

      frameless = true;
        plugins = {
          alwaysAnimate.enable = true;
          betterSettings.enable = true;
          betterFolders.enable = true;
          plainFolderIcon.enable = true;
          messageLogger.enable = true;
          fakeNitro.enable = true;
        };
      };
    };
}
