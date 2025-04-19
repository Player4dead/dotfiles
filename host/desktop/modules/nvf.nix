{

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        autocomplete.nvim-cmp.enable = true;
        languages = {
          enableLSP = true;
          nix.enable = true;
        };
      };
    };
  };
  # set nvim to default text editor
  environment.variables.EDITOR = "nvim";
}
