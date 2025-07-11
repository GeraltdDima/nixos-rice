{ pkgs, ... }:

{
	programs.neovim = {
		withNodeJs = true;
		withPython3 = true;

		coc.enable = true;

		plugins = with pkgs; [
			vimPlugins.coc-nvim
				vimPlugins.coc-sh
				vimPlugins.coc-git
				vimPlugins.coc-css
				vimPlugins.coc-json
				vimPlugins.coc-html
				vimPlugins.coc-docker
				vimPlugins.coc-tsserver
				vimPlugins.coc-pyright
		];

		extraPackages = with pkgs; [ 
			nil
			csharp-ls
		];

		coc.settings = {
			"suggest.noselect" = false;
			"suggest.enablePreview" = true;
			"suggest.enablePreselect" = false;
			"suggest.disableKind" = true;

			"languageserver" = {
				"nix" = {
					"command" = "nil";
					"filetypes" = ["nix"];
					"rootPatterns" = ["flake.nix"];
				};
			};

			"languageserver" = {
				"csharp" = {
					"command" = "csharp-ls";
					"filetypes" = ["cs"];
				};
			};
		};
	};
}
