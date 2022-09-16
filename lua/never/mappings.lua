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
