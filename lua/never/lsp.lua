local fn = vim.fn

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

opts = {}

lspconfig['clangd'].setup(opts)
