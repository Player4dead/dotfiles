{ inputs, ... }:
{

  flake.nixosModules.nix =
    { pkgs, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.optimise = {
      automatic = true;
      dates = [ "19:30" ];
      persistent = true;
};

      system.stateVersion = "25.11";
    };
}
