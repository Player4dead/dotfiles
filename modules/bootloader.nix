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

        swapDevices = [
        {
        device = "/swapfile";
        size = 24 * 1024;
        }
        ];

}
