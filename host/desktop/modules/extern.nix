{

  environment.etc.crypttab.text = ''
    extern UUID=3eb11742-6163-4c8b-acae-cf6692049aa1 /keys/key.key nofail
  '';

  fileSystems."/mnt/extern" = {
    device = "/dev/disk/by-uuid/bc176d19-15b6-49c9-ad2e-41c2c7a73591";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
      "x-systemd.automount"
      "x-systemd.device-timeout=5"
      "noauto"
    ];
  };

}
