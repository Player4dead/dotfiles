{
  description = "A very basic flake";

  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) {
        overrides = args.tackOverrides or { };
      };

      inherit (inputs.nixpkgs.lib)
        filesystem
        hasSuffix
        ;
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs self; } {
      imports = builtins.filter (hasSuffix ".nix") (filesystem.listFilesRecursive ./modules);
    };
}
