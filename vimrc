" general
syntax on
set number
set relativenumber
set virtualedit=all

" search
set hlsearch
set smartcase
set ignorecase
set incsearch

" tabs
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

" theme
set background=dark

" filetype
autocmd filetype lisp setlocal tabstop=2 shiftwidth=2 expandtab

" plugins

"" https://github.com/ctrlpvim/ctrlp.vim.git
set runtimepath^=~/.vim/bundle/ctrlp.vim

"" https://github.com/ntpeters/vim-better-whitespace
set runtimepath^=~/.vim/bundle/vim-better-whitespace
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
