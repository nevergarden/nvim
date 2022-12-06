local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

local installs = require 'nvim-treesitter.install';

installs.prefer_git = false
installs.compilers = { 'clang' }

configs.setup({
	ensure_installed = {'c', 'cpp', 'haxe', 'lua', 'fish', 'java'},
	sync_install = true,
  auto_install = false,
	highlight = {
		enable = true,
	},
	indent = {
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
