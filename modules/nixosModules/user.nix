{ self, ... }:
{
  flake.nixosModules.user =
    { pkgs, config, ... }:
    {

      imports = [ self.nixosModules.sops ];

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
    };
}
