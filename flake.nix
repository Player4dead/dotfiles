{
  description = "A very basic flake";

  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) {
        overrides = args.tackOverrides or { };
      };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs self; } (inputs.import-tree ./modules);
}
