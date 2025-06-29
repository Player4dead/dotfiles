{

  programs.nvf = {
    enable = true;
    settings.vim = {
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;

        languages = {
          nix.enable = true;
          rust.enable = true;
          };
    };
  };
  # set nvim to default text editor
  environment.variables.EDITOR = "nvim";
}

