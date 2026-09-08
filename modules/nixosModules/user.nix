{ self, ... }:
{
  flake.nixosModules.user =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      options = {
        warnings = lib.mkOption {
          apply = lib.filter (
            w: !(lib.hasInfix "If multiple of these password options are set at the same time" w)
          );
        };
      };

      config = lib.mkMerge [
        {

          users = {
            mutableUsers = false;
            users = {
              root = {
                initialPassword = "passwd";
                hashedPasswordFile = config.sops.secrets.password.path;
              };

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
        }
      ];
    };
}
