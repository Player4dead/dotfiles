{ inputs, ... }:
{

  flake.nixosModules.amd =
    { pkgs, ... }:
    {
      boot.initrd.kernelModules = [ "amdgpu" ];

      hardware.amdgpu.opencl.enable = true;

      environment.systemPackages = with pkgs; [
        clinfo
      ];

      services.lact.enable = true;

      hardware.graphics = {
        enable32Bit = true;
        enable = true;
      };

      systemd.tmpfiles.rules =
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
}
