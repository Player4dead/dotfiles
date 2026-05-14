{ inputs, ... }:
{

  flake.nixosModules.login =
    { pkgs, ... }:
    {
      services.getty.autologinUser = "player";
      services.getty.autologinOnce = true;
    };
}
