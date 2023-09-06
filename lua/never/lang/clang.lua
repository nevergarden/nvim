local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig['clangd'].setup({
	on_attach = require("lsp-format").on_attach,
})
