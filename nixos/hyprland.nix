{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		waybar
			wofi
			hyprpaper
			pavucontrol
			overskride
			wlogout
	];

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
	};
}

