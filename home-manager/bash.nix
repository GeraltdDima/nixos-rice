{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
			ff = "fastfetch";
			home-rebuild = "home-manager switch";
			upgrade = "sudo nixos-rebuild switch --upgrade";
			ls = "lsd";
			v = "vim";
			b = "bun";
			mk = "mkdir";
			th = "touch";
			zed = "zeditor";
			nf = "neofetch";
			bx = "bunx";
		};
	};
}
