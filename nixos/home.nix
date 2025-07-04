{ config, pkgs, ... }:

{
	home = {
		username = "dima";
		homeDirectory= "/home/dima";
		stateVersion = "25.05";
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
			ff="fastfetch";
		};
	};
}
