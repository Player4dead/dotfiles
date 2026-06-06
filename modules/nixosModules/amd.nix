{ inputs, ... }:
{

  flake.nixosModules.amd =
    { pkgs, ... }:
    {
      boot.initrd.kernelModules = [ "amdgpu" ];

      nixpkgs.config.rocmSupport = true;

      hardware.amdgpu = {
        opencl.enable = true;
        initrd.enable = true;
      };

      environment.systemPackages = with pkgs; [
        clinfo
        lact
      ];

      services.lact.enable = true;
      systemd = {
        packages = with pkgs; [ lact ];
        services.lactd.wantedBy = [ "multi-user.target" ];

        tmpfiles.rules =
          let
            rocmEnv = pkgs.symlinkJoin {
              name = "rocm-combined";
              paths = with pkgs.rocmPackages; [
                rocblas
                hipblas
                clr
              ];
            };
          in
          [
            "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
          ];
      };

      hardware.graphics = {
        enable32Bit = true;
        enable = true;
      };

    };
}
