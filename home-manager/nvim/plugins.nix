{ pkgs, ... }:

{
    programs.neovim.plugins = with pkgs; [
        vimPlugins.nerdtree
        vimPlugins.vim-devicons
        vimPlugins.vim-airline
        vimPlugins.github-nvim-theme
    ];
}
