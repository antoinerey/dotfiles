-- Ensure that packer.nvim (plugin manager) is installed.
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  -- Keep compiled versions of plugins out of the dotfiles repository.
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  }
})

local use = require('packer').use

-- Packer keeps itself up-to-date.
use('wbthomason/packer.nvim')

-- Custom colorscheme.
use({
  'catppuccin/nvim',
  config = function()
    vim.cmd('colorscheme catppuccin')
  end,
})  

-- Improve comments support.
use('tpope/vim-commentary')

-- Add, change, delete surrounding text.
use('tpope/vim-surround')

-- Add commands like :Rename, :SudoWrite, etc.
use('tpope/vim-eunuch')

-- Automatically adjusts tabs & spaces settings.
use('tpope/vim-sleuth')

-- Allows repeating custom commands.
use('tpope/vim-repeat')

-- Improve languages supports.
use('sheerun/vim-polyglot')

-- Automatically create parent directories if missing.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Automatically fix indentation when pasting code.
use('sickill/vim-pasta')

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
})

-- Fuzzy finder.
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

-- Display indentation lines.
use('lukas-reineke/indent-blankline.nvim')

-- Seup a status line.
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/lualine')
  end,
})

-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('user/plugins/gitsigns')
  end,
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  require('packer').sync()
end

-- Automatically source this file when it changes.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
