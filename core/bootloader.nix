{

  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
    };

    grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
  };
}
