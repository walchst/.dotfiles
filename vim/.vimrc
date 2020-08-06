    syntax on

    "set noerrorbells
    set belloff=all
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set number relativenumber
    set nowrap
    set incsearch

" Enable autocompletion:
    set wildmode=longest,list,full


" Plugins
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-fugitive'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    call plug#end()
" Colours
    set colorcolumn=80
    colorscheme gruvbox
    set background=dark
    highlight ColorColumn ctermbg=0 guibg=lightgrey

