require('nvim-treesitter.configs').setup({
  -- Ensure that all supported languages are installed.
  ensure_installed = 'all',
  -- Enable the highlighting capabiilities.
  highlight = {
    enable = true,
  },
  -- Enable the commentstring Treesitter plugin.
  context_commentstring = {
    enable = true,
  },
})  
