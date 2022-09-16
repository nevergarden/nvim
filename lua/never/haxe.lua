-- Set haxe filetypes
vim.cmd [[ au BufNewFile,BufRead *.hx,*.hxml setfiletype haxe ]]
local install_path = vim.fn.stdpath('data') .. '/site/tree-sitter-haxe'

-- Bootstrap Haxe-Treesitter
local fn = vim.fn
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/vantreeseba/tree-sitter-haxe', install_path})
end

-- Treesitter For Haxe
local ts_parsers_ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
if ts_parsers_ok then
	local parser_config = ts_parsers.get_parser_configs()
	parser_config.haxe = {
		install_info = {
			url = install_path,
			files = {"src/parser.c"},
			generate_requires_npm = false,
			requires_generate_from_grammar = true,
		},
		filetype = "hx",
	}
end

-- LSP for Haxe
local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig['haxe_language_server'].setup({
	cmd = {'node', '/home/nevergarden/haxe-language-server/bin/server.js'},
})
