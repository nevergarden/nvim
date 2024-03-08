-- Keyboard Mappings

-- Options
local opts = { noremap = true, silent = true }
-- Shorthand keymap function
local keymap = vim.api.nvim_set_keymap

-- Set leader to <Space>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvim Tree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Don't lose visual on indentation
keymap("v", '<', '<gv', opts)
keymap("v", '>', '>gv', opts)

-- Format Hotkey
keymap("n", '<C-f>', ':lua vim.lsp.buf.format()<CR>', opts)

-- LSP
keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

-- Tabbar
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
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
keymap("n", '<Leader>o', ':Telescope fd<CR>', opts)
keymap("n", '<Leader>t', ':Telescope treesitter<CR>', opts)
keymap("n", '<C-k><C-t>', ':Telescope colorscheme<CR>', opts)
keymap("n", '<C-k><C-d>', ':Telescope dap variables<CR>', opts)
keymap("n", '<C-k><C-s>', ':Telescope dap frames<CR>', opts)

-- Trouble
keymap("n", '<Leader>d', ':Trouble<CR>', opts)

-- Don't lose visual on indentation
keymap("v", '<', '<gv', opts)
keymap("v", '>', '>gv', opts)

-- Tagbar Hotkey
keymap("", '<C-k>', ':Tagbar<CR>', opts)

-- Format Hotkey
keymap("n", '<C-f>', ':lua vim.lsp.buf.format()<CR>', opts)

-- TABTAB!
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)

-- Zenmode Toggle
keymap('n', '<A-z>', ':ZenMode<CR>', opts)
