local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

lspconfig['cmake'].setup({
	cmd = {'cmake-language-server'},
	filetypes = {'cmake'},
})
