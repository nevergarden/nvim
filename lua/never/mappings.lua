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

-- Dap
keymap("n", '<Leader>r', ':Telescope dap configurations<CR>', opts)
keymap("n", '<Leader>b', ':lua require("dap").toggle_breakpoint()<CR>', opts)
keymap("n", '<F5>', ':lua require("dap").continue()<CR>', opts)
keymap("n", '<Leader>c', ':lua require("dap").repl.open()<CR>', opts)
