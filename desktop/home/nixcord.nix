{
  programs.nixcord = {
  enable = true;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/B4T3S/DiscordDarkNeon/refs/heads/master/DarkNeon.theme.css"
        "https://saltssaumure.github.io/pios-discord-theme/piOS.theme.css"
      ];

      frameless = true;
        plugins = {
          alwaysAnimate.enable = true;
          betterSettings.enable = true;
          betterFolders.enable = true;
          plainFolderIcon.enable = true;
          messageLogger.enable = true;
          emoteCloner.enable = true;
          silentTyping.enable = true;
          imageZoom.enable = true;
          betterUploadButton.enable = true;
          fullSearchContext.enable = true;
          clearURLs.enable = true;
          };
      };
    };
}
