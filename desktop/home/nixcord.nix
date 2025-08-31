{ inputs, ... }: {
 imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
  enable = true;
    config = {
      themeLinks = [
        "https://refact0r.github.io/midnight-discord/build/midnight.css"
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
          showHiddenThings.enable = true;
          showHiddenChannels.enable = true;
          };
      };
    };
}
