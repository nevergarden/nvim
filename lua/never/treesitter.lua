local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end


configs.setup({
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		colors = {
			"Gold",
			"Orchid",
			"DodgerBlue"
		},
	},
})
