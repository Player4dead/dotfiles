{inputs, ...}: {
  flake.nixosModules.nixcord = {pkgs, ...}: {
    imports = [inputs.nixcord.nixosModules.nixcord];

    programs.nixcord = {
      enable = true;
      user = "player";
      discord.vencord.enable = true;
      config = {
        transparent = true;
        themeLinks = [
          "https://refact0r.github.io/midnight-discord/build/midnight.css"
        ];
        frameless = true;
        plugins = {
          # alwaysAnimate.enable = true;
          betterSettings.enable = true;
          messageLogger.enable = true;
          silentTyping.enable = true;
          imageZoom.enable = true;
          betterUploadButton.enable = true;
          fullSearchContext.enable = true;
          clearUrls.enable = true;
          showHiddenThings.enable = true;
          # showHiddenChannels.enable = true;

          petpet.enable = true;
        };
      };
    };
  };
}
