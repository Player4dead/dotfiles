{ pkgs, inputs, ... }:
{

  environment.systemPackages = with pkgs; [
    waybar
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

  #greeter
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        # Change "Hyprland" to the command to run your window manager. ^Note1
        command = "Hyprland";
        # Change "${user}" to your username or to your username variable.
        user = "player4dead";
      };
      # By adding default_session it ensures you can still access the tty terminal if you logout of your windows manager otherwise you would just relaunch into it.
      default_session = {
        # Again here just change "-cmd Hyprland" to "-cmd your-start-command".
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome To NixOS' --asterisks --remember --remember-user-session --time -cmd Hyprland";
        # DO NOT CHANGE THIS USER
        user = "greeter";
      };
    };
  };

}

