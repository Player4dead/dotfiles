{

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
        };
      };
    };


}
