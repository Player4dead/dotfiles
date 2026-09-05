# {
#   description = "A very basic flake";

#   outputs =
#     let
#       inputs = import ./.tack;
#     in
#     inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
# }

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
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = builtins.filter (hasSuffix ".nix") (filesystem.listFilesRecursive ./modules);
    };
}
