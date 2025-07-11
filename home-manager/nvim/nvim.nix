let
  colorscheme = "github_dark";
in {
  programs.neovim = {
    enable = true;

    extraConfig = ''
      set number
      set relativenumber
      set cursorline
      set nocompatible
      set smarttab
      set shiftwidth=4
      set tabstop=4
      set completeopt=menuone,noinsert,noselect
      syntax on
      filetype plugin on

      nnoremap <C-f> :NERDTreeFind<CR>
      nnoremap <C-r> :NERDTreeToggle<CR>

      colorscheme ${colorscheme}

      inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : CheckBackspace() ? "\<Tab>" : coc#refresh()
      inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

      function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
    '';
  };

  imports = [
    ./plugins.nix
    ./coc.nix
  ];
}

