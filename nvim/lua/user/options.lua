-- Expand tabs into two spaces.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Enable soft wrap.
vim.opt.wrap = true

-- Always keep two columns free for icons and signs.
vim.opt.signcolumn = 'yes:2'

-- Automatically indent lines when necessary. 
vim.opt.smartindent = true

-- Display relative line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Configure auto-completion behaviour when typing commands.
vim.opt.wildmode = 'longest:full,full'

-- Enable mouse in all modes.
vim.opt.mouse = 'a'

-- Enable full colours palette.
vim.opt.termguicolors = true

-- Improve search experience.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remove the ugly ~ from end of buffer.
vim.opt.fillchars:append({ eob = ' ' })

-- Open new splits as expected.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Always keep the cursor at the center of the screen.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Use system clipboard.
vim.opt.clipboard = 'unnamedplus'

-- Ask for confirmation instead of erroring when leaving with unsaved changes.
vim.opt.confirm = true

-- Persist undo history to disk between sessions.
vim.opt.undofile = true

-- Enable backup, out of the current directory.
vim.opt.backup = true
vim.opt.backupdir:remove('.')
