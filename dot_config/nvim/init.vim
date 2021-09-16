" ---

set number
set relativenumber
set noerrorbells
set nowrap
set encoding=UTF-8

" Use spaces instead of tabs.
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" ---

call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" ---

let mapleader = " "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
