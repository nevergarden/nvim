local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorthand function name
local keymap = vim.api.nvim_set_keymap

-- Leader = <Space>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvim Tree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Hop Mappings
keymap("n", 'f', ':HopWord<CR>', opts)

-- Telescope
keymap("n", '<C-p>', ':Telescope<CR>', opts)
keymap("n", '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', opts)
keymap("n", '<Leader>o', ':Telescope fd<CR>', opts)
keymap("n", '<Leader>t', ':Telescope treesitter<CR>', opts)
keymap("n", '<C-k><C-t>', ':Telescope colorscheme<CR>', opts)

-- Trouble
keymap("n", '<Leader>d', ':Trouble<CR>', opts)
