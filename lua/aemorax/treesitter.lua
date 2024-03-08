local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if status_ok then
	local installs = require 'nvim-treesitter.install';

	installs.prefer_git = false
	installs.compilers = { 'clang' }

	configs.setup({
		ensure_installed = { 'c', 'cpp', 'lua', 'fish', 'python', 'haxe'},
		sync_install = false,
		auto_install = true,
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
	})
end
