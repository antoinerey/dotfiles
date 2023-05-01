-- Set space as leader key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Keep the cursor at the same place when yanking in visual mode.
-- https://ddrscott.github.io/blog/2016/yank-without-jank
vim.keymap.set('v', 'y', 'myy`y')

-- Disable the anoying command line typo.
vim.keymap.set('n', 'q:', ':q')

-- Paste in visual mode without copying the target at the same time.
vim.keymap.set('v', 'p', '"_dP')

-- Easily hide search highlight.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Easily exit from insert mode.
vim.keymap.set('i', 'jk', '<Esc>l')

-- Move lines up and down.
--   Ï corresponds to Alt+j.
--   È corresponds to Alt+k.
vim.keymap.set('i', 'Ï', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', 'È', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', 'Ï', ':move .+1<CR>==')
vim.keymap.set('n', 'È', ':move .-2<CR>==')
vim.keymap.set('v', 'Ï', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', 'È', ":move '<-2<CR>gv=gv")
