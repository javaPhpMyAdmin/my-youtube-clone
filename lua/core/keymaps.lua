vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>h', ':nohlsearch<CR>')
keymap.set('n', 'dw', 'vb"_d')
keymap.set('i', 'jj', '<ESC>', opts)
keymap.set('n', '<Space>w', ':w<CR>')
keymap.set('n', '<Space>q', ':q<CR>')

keymap.set('n', '<Space>/', ':Commentary<CR>', opts)

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
keymap.set('n', 'vs', ':vsplit<Return><C-w>w', opts)

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<leader>f', '<C-w>=')

keymap.set('n', '<space>bn', ':bn<CR>')
keymap.set('n', '<space>bp', ':bp<CR>')
keymap.set('n', '<space>bd', ':bd<CR>')

keymap.set('n', '<leader>ms', ':MaximizerToggle<CR>')
