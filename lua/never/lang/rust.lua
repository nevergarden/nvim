local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig['rust_analyzer'].setup({
	on_attach = require("lsp-format").on_attach,
})
