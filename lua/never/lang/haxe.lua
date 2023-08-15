-- Set haxe filetypes
vim.cmd [[ au BufNewFile,BufRead *.hx,*.hxml setfiletype haxe ]]
local install_path = vim.fn.stdpath('data') .. '/site/tree-sitter-haxe'
local haxe_ls_path = vim.env.HAXE_LANGUAGE_SERVER

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
		highlight = { enable = true },
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

-- Bootstrap Installing Haxe Language Serever
local hxls_bin = ''

if not haxe_ls_path then
	haxe_ls_path = fn.stdpath('data') .. '/lsp_servers/haxe_language_server'
end

if fn.empty(fn.glob(haxe_ls_path)) > 0 then
	local hls_git = "https://github.com/vshaxe/haxe-language-server"
	fn.system({'git', 'clone', '--depth=1', hls_git, haxe_ls_path})
end

hxls_bin = haxe_ls_path .. '/bin/server.js'
if(fn.empty(fn.glob(hxls_bin))) > 0 then
	os.execute('cd ' .. haxe_ls_path .. ' && npm install')
	os.execute('cd ' .. haxe_ls_path .. ' && npx lix run vshaxe-build -t language-server')
end

lspconfig['haxe_language_server'].setup({
	on_attach = require('lsp-format').on_attach,
	cmd = {'node', hxls_bin},
})
