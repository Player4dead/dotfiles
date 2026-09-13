{

  flake.nixosModules.zsh = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      # interactiveShellInit = "fastfetch";

      histSize = 10000;
      histFile = "$HOME/.zsh_history";
      setOptions = [
        "HIST_IGNORE_ALL_DUPS"
      ];

      ohMyZsh = {
        enable = true;
        plugins = [
          "z"
          "extract"
          "sudo"
        ];
        theme = "kardan";
      };

    };
  };
}
