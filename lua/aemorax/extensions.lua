local has_todo_comments, todo_comments = pcall(require, "todo-comments")
if has_todo_comments then
	todo_comments.setup()
end

local lualine_ok, lualine = pcall(require, 'lualine')
if lualine_ok then
	lualine.setup({
		disabled_filetypes = { 'NvimTree' },
		sections = {
			lualine_x = { require("action-hints").statusline },
		},
	})
end

local has_ibl, ibl = pcall(require, 'ibl')

if has_ibl then
	ibl.setup({})
end

local hop_ok, hop = pcall(require, 'hop')
if hop_ok then
	hop.setup()
end

local telescope_ok, telescope = pcall(require, 'telescope')

if telescope_ok then
	telescope.setup({})
end
