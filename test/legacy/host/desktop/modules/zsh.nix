{ pkgs, ... }:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

}
