{

  environment.etc.crypttab.text = ''
    extern UUID=5011b7da-c021-4511-b273-5c6f5b85b636 /keys/key.key nofail
  '';

  fileSystems."/mnt/extern" = {
    device = "/dev/disk/by-uuid/a4961deb-90b2-4502-8b61-42cececf52bf";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "x-systemd.automount"
      "x-systemd.device-timeout=5"
      "auto"
    ];
  };

}
