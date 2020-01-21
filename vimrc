" general
syntax enable
set number
set relativenumber
set virtualedit=all

" theme
set background=dark
colorscheme solarized

" search
set hlsearch
set smartcase
set ignorecase
set incsearch

" tabs
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
inoremap <S-Tab> <C-d>

" plugins

"" https://github.com/ctrlpvim/ctrlp.vim.git
set runtimepath^=~/.vim/bundle/ctrlp.vim

"" https://github.com/ntpeters/vim-better-whitespace
set runtimepath^=~/.vim/bundle/vim-better-whitespace
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"" https://github.com/airblade/vim-gitgutter
set runtimepath^=~/.vim/bundle/vim-gitgutter
