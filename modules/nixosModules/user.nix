{ inputs, sops, ... }:
{

  flake.nixosModules.user =
    { pkgs, config, ... }:
    {
      users.users.player4dead = {
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" ];

        hashedPasswordFile = config.sops.secrets.password.path;
      };

      sops.secrets.password.neededForUsers = true;
      programs.zsh.enable = true;
    };
}
