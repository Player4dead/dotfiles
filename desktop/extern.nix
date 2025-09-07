{

  environment.etc.crypttab.text = ''
    vault UUID=31e4bcf0-7c5a-4535-a148-869515c972b0 /keys/key.key nofail
  '';

  fileSystems = {
"/mnt/vault" = {
  device = "/dev/disk/by-uuid/31e4bcf0-7c5a-4535-a148-869515c972b0";
  fsType = "btrfs";
  options = [
    "defaults"
    "noatime"
    "x-systemd.automount"
    "x-systemd.device-timeout=5"
    "auto"
  ];
};


  "/mnt/games" = {
    device = "/dev/disk/by-uuid/5666f24a-320f-4f3a-bb9a-afcc667f1120";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "x-systemd.device-timeout=5"
      "auto"
    ];
  };
  };

}
