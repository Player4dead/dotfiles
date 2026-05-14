{ inputs, sops, ... }:
{

  flake.nixosModules.user =
    { pkgs, config, ... }:
    {

      users = {
        mutableUsers = false;
        users = {
          root.initialPassword = "passwd";

          player = {
            shell = pkgs.zsh;
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            initialPassword = "passwd";

            hashedPasswordFile = config.sops.secrets.password.path;
          };
        };
      };

      sops.secrets.password.neededForUsers = true;
      programs.zsh.enable = true;
    };
}
