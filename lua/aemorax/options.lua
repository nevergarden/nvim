local options = {
	backup = false,            -- don't create backup file
	clipboard = "unnamedplus", -- access system clipboard
	ignorecase = true,         -- ignore case in search patterns
	shiftwidth = 2,            -- the number of space inserted for indentation
	tabstop = 2,               -- insert 4 spaces for tab
	number = true,             -- enable line numbering
	relativenumber = true,     -- enable relative numbering
	numberwidth = 2,           -- width of number columns
	signcolumn = "yes",        -- git gutter always have sign column
	autoindent = false,        -- indent from last line
	smartindent = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end
