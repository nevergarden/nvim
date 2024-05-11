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

-- Tabbar
keymap('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<Leader>.', '<Cmd>BufferNext<CR>', opts)
keymap('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<Leader>0', '<Cmd>BufferLast<CR>', opts)
keymap('n', '<Leader>c', '<Cmd>BufferClose<CR>', opts)

-- Split Move
keymap('n', '<Leader>h', '<C-w>h', opts)
keymap('n', '<Leader>j', '<C-w>j', opts)
keymap('n', '<Leader>k', '<C-w>k', opts)
keymap('n', '<Leader>l', '<C-w>l', opts)

-- Zenmode Toggle
keymap('n', '<A-z>', ':ZenMode<CR>', opts)
