{ inputs, ... }:
{

  flake.nixosModules.sops =
    { pkgs, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        defaultSopsFile = ./../../secrets/secrets.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/player/.config/sops/age/keys.txt";
      };

      environment.systemPackages = with pkgs; [ age ];
    };
}
