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

-- TABTAB!
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
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
-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
keymap('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)
