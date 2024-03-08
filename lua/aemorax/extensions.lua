local has_todo_comments, todo_comments = pcall(require, "todo-comments")
if has_todo_comments then
	todo_comments.setup()
end

local lualine_ok, lualine = pcall(require, 'lualine')
if lualine_ok then
	local custom_default = require('lualine.themes.auto')
	custom_default.normal.a.bg = '#302b2a'
	custom_default.normal.a.fg = 'black'
	custom_default.normal.b.bg = 'white'
	custom_default.normal.b.fg = 'black'
	custom_default.normal.c.bg = 'white'
	custom_default.normal.c.fg = 'black'

	custom_default.insert.a.bg = '#302b2a'
	custom_default.insert.a.fg = 'black'
	custom_default.insert.b.bg = 'white'
	custom_default.insert.b.fg = 'black'
	custom_default.insert.c.bg = 'white'
	custom_default.insert.c.fg = 'black'

	custom_default.visual.a.bg = '#302b2a'
	custom_default.visual.a.fg = 'black'
	custom_default.visual.b.bg = 'white'
	custom_default.visual.b.fg = 'black'
	custom_default.visual.c.bg = 'white'
	custom_default.visual.c.fg = 'black'

	custom_default.command.a.bg = '#302b2a'
	custom_default.command.a.fg = 'black'
	custom_default.command.b.bg = 'white'
	custom_default.command.b.fg = 'black'
	custom_default.command.c.bg = 'white'
	custom_default.command.c.fg = 'black'

	lualine.setup({
		disabled_filetypes = { 'NvimTree' },
		options = {
			theme = custom_default
		}
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
