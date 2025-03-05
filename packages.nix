{ pkgs, ... }: {

	nixpkgs.config.allowUnfree = true;

  	environment.systemPackages = with pkgs; [
        	# wichtige packete
		nixfmt-rfc-style
		home-manager
		microcodeAmd
		nomacs
		alsa-utils
		btop
		nemo
		tealdeer
		git
		yazi
                pavucontrol
                gparted
                nh

		# editor
		zettlr
		nixd

                # libreoffice packages
                libreoffice-qt
                hunspell
                hunspellDicts.de_DE
                hunspellDicts.de_CH
                hunspellDicts.en_US

		i2p
		librewolf-bin
                ungoogled-chromium
                mullvad-browser

		godot_4

		# gaming
		mindustry
		lutris
		mangohud
		heroic
		the-powder-toy
                bottles

		discord

		# random
		xarchiver
		ffmpeg-full
		mpv
                vlc
		tor-browser
		keepassxc
		#qbittorrent
		#blender-hip
		lmms

		# download
		vdhcoapp
		yt-dlp

		# hyprland
		waybar
		dunst
		libnotify
		swww
		kitty
		rofi-wayland
		networkmanagerapplet
		udiskie
		hyprshot
		#hyprpolkitagent
  	];

}
