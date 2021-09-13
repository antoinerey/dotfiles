call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" ---

let mapleader = " "

nnoremap <leader>ff :Telescope find_files<cr>
