{

programs.zsh = {
  enable = true;
  enableCompletions = true;
  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

  history.size = 10000;

  oh-my-zsh = {
    enable = true;
    plugins = [ "thefuck" "z" ];
    theme = "darkblood";
  };

};

}
