local status_ok

local numb
status_ok, numb = pcall(require, 'numb')
if status_ok then
	numb.setup()
end

local nvimtree
status_ok, nvimtree = pcall(require, 'nvim-tree')
if status_ok then
	nvimtree.setup()
end

local hop
status_ok, hop = pcall(require, 'hop')
if status_ok then
	hop.setup()
end

local lualine
status_ok, lualine = pcall(require, 'lualine')
if status_ok then
	lualine.setup({
		options = {
			theme = 'gruvbox'
		}
	})
end
