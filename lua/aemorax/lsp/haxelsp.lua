local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

-- Set haxe filetypes
vim.cmd [[ au BufNewFile,BufRead *.hx,*.hxml,*.dbs setfiletype haxe ]]

vim.filetype.add({
  extension = {
    hx = 'haxe',
  },
})


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.haxe = {
  install_info = {
    url = "https://github.com/vantreeseba/tree-sitter-haxe",
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main",
  },
  filetype = "haxe",
}

lspconfig['haxe_language_server'].setup({})
