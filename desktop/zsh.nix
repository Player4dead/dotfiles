{

programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];


    ohMyZsh = {
      enable = true;
      plugins = [
        "thefuck"
        "z"
      ];
      theme = "darkblood";
    };

  };

programs.thefuck.enable = true;
}
