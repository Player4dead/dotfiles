{

  #environment.etc.crypttab.text = ''
    #extern UUID=5011b7da-c021-4511-b273-5c6f5b85b636 /keys/key.key nofail
  #'';

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/5666f24a-320f-4f3a-bb9a-afcc667f1120";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "x-systemd.device-timeout=5"
      "auto"
    ];
  };

}
