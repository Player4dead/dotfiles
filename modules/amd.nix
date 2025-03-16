{ pkgs, ... }:
{

  systemd.packages = with pkgs; [ lact ];

  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  nixpkgs.config.rocmSupport = true;

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
    [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
    rocmPackages.clr.icd
    amdvlk
  ];

  environment.systemPackages = with pkgs; [
    clinfo
    lact
    vkd3d
    vkd3d-proton
  ];

  # For 32 bit applications
  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

}
