{ config, pkgs, ... }:

{
    home = {
        username = "dima";
        homeDirectory= "/home/dima";
        stateVersion = "25.05";

        pointerCursor = {
            gtk.enable = true;
            package = pkgs.adwaita-icon-theme;
            name = "Adwaita";
            size = 24;
        };

        packages = with pkgs; [
            glib
            gsettings-desktop-schemas
        ];
    };

    imports = [
        ./bash.nix
        ./alacritty.nix
        ./hyprland.nix
        ./waybar.nix
        ./wofi.nix
        ./gtk.nix
        ./git.nix
    ];
}
