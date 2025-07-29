{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
    libnotify
    swww
    kitty
    networkmanagerapplet
    udiskie
    hyprshot
    fuzzel
    ];

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = { };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # usb und security
  services.udisks2.enable = true;
  security.polkit.enable = true;

}
