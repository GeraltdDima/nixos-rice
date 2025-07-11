{
	programs.fish = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
			ff = "fastfetch";
			home-rebuild = "home-manager switch";
			upgrade = "sudo nixos-rebuild switch --upgrade";
			ls = "lsd";
			v = "nvim";
			b = "bun";
			mk = "mkdir";
			th = "touch";
			zed = "zeditor";
			nf = "neofetch";
			bx = "bunx";
			binst = "bun install";
			badd = "bun add";
			d = "dotnet";
			dnew = "dotnet new";
			dadd = "dotnet add package";
			pip = "uv pip";
		};

		interactiveShellInit = ''
			set fish_greeting
			source ~/.venv/bin/activate.fish
			'';
	};

	imports = [
		./plugins.nix
	];
}
