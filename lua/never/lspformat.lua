local lspfrmt_status_ok, lspformat = pcall(require, 'lsp-format')
if not lspfrmt_status_ok then
	return
end

lspformat.setup({})
